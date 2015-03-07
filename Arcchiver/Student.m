//
//  Student.m
//  Arcchiver
//
//  Created by zhifei on 15/3/7.
//  Copyright (c) 2015年 ZhiFei(qiuzhifei521@gmail.com). All rights reserved.
//

#import "Student.h"

@implementation Student

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeFloat:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeFloatForKey:@"age"];
    }
    
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    Student *stu = [[[self class] allocWithZone:zone] init];
    stu.name = self.name;
    stu.age = self.age;
    return stu;
}
@end
