//
//  NSObject+Attribution.m
//  Sale-OC
//
//  Created by minug on 15/12/26.
//  Copyright © 2015年 minug. All rights reserved.
//

#import "NSObject+XAttribution.h"
#import <objc/runtime.h>


@implementation NSObject (XAttribution)

NSMutableArray *arrayPoint ;
NSMutableDictionary *dictPoint;

-(NSMutableArray *)x_attributeArray{
    id array =  objc_getAssociatedObject(self, (__bridge const void *)(arrayPoint));
    if (!array) {
        array = [NSMutableArray array];
        [self setX_attributeArray:array];
    }
    return array;
}

-(void)setX_attributeArray:(NSMutableArray *)x_attributeArray{
    objc_setAssociatedObject(self, (__bridge const void *)(arrayPoint), x_attributeArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setX_attributeDict:(NSMutableDictionary *)x_attributeDict{
    objc_setAssociatedObject(self, (__bridge const void *)(dictPoint), x_attributeDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableDictionary *)x_attributeDict{
    id dict = objc_getAssociatedObject(self, (__bridge const void *)(dictPoint));
    
    if (!dict) {
        dict = [NSMutableDictionary dictionary];
        [self setX_attributeDict:dict];
    }
    return dict;
}


@end
