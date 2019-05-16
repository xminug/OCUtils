
//  XAlertView.m
//  ShoesSeller
//
//  Created by minug on 15/10/23.
//  Copyright © 2015年 minug. All rights reserved.
//

#import "XAlertView.h"
#import <UIAlertController_Blocks/UIAlertController+Blocks.h>


@interface XAlertView () <UIAlertViewDelegate>

@end

@implementation XAlertView

#pragma mark - 提醒事件

+(UIViewController *)rootViewController
{
    return [[UIApplication sharedApplication] keyWindow].rootViewController;
}

+ (void)TTAlert:(NSString *)title message:(NSString *)message {
    [UIAlertController showAlertInViewController:[self rootViewController] withTitle:title message:message cancelButtonTitle:@"我知道了" destructiveButtonTitle:nil otherButtonTitles:nil tapBlock:nil];
}

#pragma mark - 带回调事件
+ (void)TTAlert:(NSString *)title message:(NSString *)message confirmBlock:(ConfirmBlock) block{
    
    [UIAlertController showAlertInViewController:[self rootViewController] withTitle:title message:message cancelButtonTitle:@"确认" destructiveButtonTitle:nil otherButtonTitles:nil tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        block(@"");
    }];
}


#pragma mark - 带回调事件，带取消
+ (void)TTAlertC:(NSString *)title message:(NSString *)message confirmBlock:(ConfirmBlock) block{
    [UIAlertController showAlertInViewController:[self rootViewController] withTitle:title message:message cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"确认"] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        if (buttonIndex == 2) {
            block(@"");
        }
    }];
    
}

+(void)TTAlertC:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles  confirmBlock:(ConfirmBlock) block{
    [UIAlertController showAlertInViewController:[self rootViewController] withTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherButtonTitles:@[otherButtonTitles] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        if (buttonIndex == 2) {
            block(@"");
        }
    }];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles,nil];
    
//    oBlock = block;
    
//    [alert show];
}

+(void)TTAlertC:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles  confirmBlock:(ConfirmBlock) confirmblock cancelBlock:(CancleBlock)cancelblock{
    
    [UIAlertController showAlertInViewController:[self rootViewController] withTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherButtonTitles:@[otherButtonTitles] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            cancelblock(@"");
        }else{
            confirmblock(@"");
        }
    }];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles,nil];
//    
////    oBlock = confirmblock;
////    cBlock = cancelblock;
//    
//    [alert show];
    
}

//+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    
//    if (oBlock) {
//        if((long)alertView.numberOfButtons == 2){
//            if ((long)buttonIndex == 1) {
//                if (oBlock) {
//                    oBlock(@"okClick");
//                }
//            }else if ((int)buttonIndex == 0 ){
//                if (cBlock) {
//                    cBlock(@"");
//                }
//            }
//        }else{
//            if (oBlock) {
//                oBlock(@"okClick");
//            }
//        }
//    }
//    cBlock = nil;
//    oBlock = nil;
//}

@end
