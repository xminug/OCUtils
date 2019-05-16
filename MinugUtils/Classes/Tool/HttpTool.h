//
//  HttpTool.h
//  ShoesSeller
//
//  Created by minug on 15/11/16.
//  Copyright © 2015年 minug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUCommon.h"


@interface HttpTool : NSObject

+(void)GETWithURLString:(NSString *)urlString parameters:(NSDictionary *)paremeters success:(NetWorkSuccessBlock)success failure:(NetWorkFailureBlock)failure;

+(void)POSTWithURLString:(NSString *)urlString parameters:(NSDictionary *)paremeters success:(NetWorkSuccessBlock)success failure:(NetWorkFailureBlock)failure;

+(void)Request:(NSURLRequest *)request success:(NetWorkSuccessBlock)success failure:(NetWorkFailureBlock)failure;
+(void)Request:(NSURLRequest *)request completionHandler:(void (^)(NSURLResponse *, NSData *, NSError * ))handler;
@end
