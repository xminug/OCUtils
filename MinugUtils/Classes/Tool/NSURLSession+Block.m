//
//  NSURLSession+Block.m
//  HXD
//
//  Created by minug on 2016/11/26.
//  Copyright © 2016年 minug. All rights reserved.
//

#import "NSURLSession+Block.h"

@implementation NSURLSession (Block)

+(void)sendAsynchronousRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))handler{
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (handler) {
            handler(response,data,error);
        }
    }];
    [task resume];
}

@end
