//
//  UIImageView+cacheURLImage.m
//  JuHappy
//
//  Created by minug on 15/8/1.
//  Copyright (c) 2015年 plusman. All rights reserved.
//

#import "UIImageView+CacheURLImage.h"
#import "NSString+Password.h"

@implementation UIImageView (CacheURLImage)


static NSString *cacheDir ;

+(UIImage *)cacheImageWithUrl:(NSURL *)url{
    if ([url isEqual:[NSNull null]]) {
        return nil;
    }
    if ((!url)|| (!url.absoluteString.length) ) {
        return nil;
    }
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if (![filemgr fileExistsAtPath:cacheDir isDirectory:NULL]) {
        [filemgr createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:nil];
        return nil;
    }
    NSString *imageStr = [cacheDir stringByAppendingPathComponent:[NSString md5:url.absoluteString]];
    if ([filemgr fileExistsAtPath:imageStr]) {
        return [[UIImage alloc] initWithData:[NSData dataWithContentsOfFile:imageStr]];
    }else{
        return nil;
    }
    
}

+(void)initialize{
    cacheDir = [(NSString *)[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/juCacheImagine"];
}

-(void)x_setImageWithUrl:(NSURL *)url placeholder:(UIImage *)placeholder finishBlock:(void (^)(UIImage *image))finish{
    WEAKSELF
    
    if (![placeholder isEqual: [NSNull null]]) {
        self.image = placeholder;
    }
    if ([url isEqual:[NSNull null]]) {
        return;
    }
    if ((!url)|| (!url.absoluteString.length) ) {
        return;
    }
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if (![filemgr fileExistsAtPath:cacheDir isDirectory:NULL]) {
        [filemgr createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *imageStr = [cacheDir stringByAppendingPathComponent:[NSString md5:url.absoluteString]];
    if ([filemgr fileExistsAtPath:imageStr]) {
        UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfFile:imageStr]];
        self.image = img;
    }else{
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            UIImage *image = [[UIImage alloc] initWithData:data];
            [UIImageJPEGRepresentation(image, 1)  writeToFile:imageStr atomically:YES];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                weakSelf.image = image;
                if (finish) {
                    finish(image);
                }
            }];
        }];
    }
}

-(void)x_setImageWithUrl:(NSURL *)url placeholder:(UIImage *)placeholder{
    WEAKSELF
    
    if (![placeholder isEqual: [NSNull null]]) {
        self.image = placeholder;
    }
    if ([url isEqual:[NSNull null]]) {
        return;
    }
    if ((!url)|| (!url.absoluteString.length) ) {
        return;
    }
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if (![filemgr fileExistsAtPath:cacheDir isDirectory:NULL]) {
        [filemgr createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *imageStr = [cacheDir stringByAppendingPathComponent:[NSString md5:url.absoluteString]];
    if ([filemgr fileExistsAtPath:imageStr]) {
        self.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfFile:imageStr]];
    }else{
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            UIImage *image = [[UIImage alloc] initWithData:data];
            [UIImageJPEGRepresentation(image, 1)  writeToFile:imageStr atomically:YES];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                weakSelf.image = image;
            }];
        }];
    }
}

@end
