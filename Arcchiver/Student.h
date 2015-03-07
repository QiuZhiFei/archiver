//
//  Student.h
//  Arcchiver
//
//  Created by zhifei on 15/3/7.
//  Copyright (c) 2015年 ZhiFei(qiuzhifei521@gmail.com). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Student : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat age;

@end
