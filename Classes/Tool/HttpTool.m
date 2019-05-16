//
//  HttpTool.m
//  ShoesSeller
//
//  Created by minug on 15/11/16.
//  Copyright © 2015年 minug. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool

+(void)GETWithURLString:(NSString *)urlString parameters:(NSDictionary *)paremeters success:(void(^)(id  _Nonnull responseObject))success failure:(void(^)(NSError * _Nonnull error))failure{
    if (![urlString hasPrefix:@"http"]) {
        urlString = [NSString stringWithFormat:@"http://%@",urlString];
    }
    NSMutableString *str = [NSMutableString stringWithFormat:@"%@?",urlString];
    [str appendString:[self parametersStrWithparameters:paremeters]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str] cachePolicy:0 timeoutInterval:10.0f];
    [self Request:request success:success failure:failure];
    
//    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        
//    }];
    
}

+(void)POSTWithURLString:(NSString *)urlString parameters:(NSDictionary *)paremeters success:(void(^)(id  _Nonnull responseObject))success failure:(void(^)( NSError * _Nonnull error))failure{
    if (![urlString hasPrefix:@"http"]) {
        urlString = [NSString stringWithFormat:@"http://%@",urlString];
    }
    NSLog(@"%@",[NSThread currentThread]);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:0 timeoutInterval:10.0f];
    request.HTTPMethod = @"POST";
    NSMutableString *str = [self parametersStrWithparameters:paremeters];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    [self Request:request success:success failure:failure];
//    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        
//    }];
    
    
}

+(void)Request:(NSURLRequest *)request success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    DLog(@"%@",request);
    [NSURLSession sendAsynchronousRequest:request completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            if (failure) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{failure(connectionError);}];
            }
            return ;
        }
        DLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        if (!success) {
            return;
        }
        @try {
            id json = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{success(json);}];
        } @catch (NSException *exception) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{success(nil);}];
        }
        
        
    }];
}

+(void)Request:(NSURLRequest *)request completionHandler:(void (^)(NSURLResponse * _Nullable, NSData * _Nullable, NSError * _Nullable))handler{
    [NSURLSession sendAsynchronousRequest:request completionHandler:handler];
}

+(NSMutableString *)parametersStrWithparameters:(NSDictionary *)paremeters{
    NSMutableString *str = [NSMutableString string];
    NSArray *keys = paremeters.allKeys;
    if (keys.count) {
        [str appendFormat:@"%@=%@",keys[0],paremeters[keys[0]]];
        for (int i = 1; i<keys.count; i++) {
            [str appendFormat:@"&%@=%@",keys[i],paremeters[keys[i]]];
        }
    }
    return str;
}

@end
