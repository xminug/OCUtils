//
//  NSURLSession+Block.h
//  HXD
//
//  Created by minug on 2016/11/26.
//  Copyright © 2016年 minug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession (Block)

+(void)sendAsynchronousRequest:(NSURLRequest *)request completionHandler:(void(^)(NSURLResponse * response, NSData * data, NSError * connectionError)) handler ;

@end
