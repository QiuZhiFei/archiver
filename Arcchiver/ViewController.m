//
//  ViewController.m
//  Arcchiver
//
//  Created by zhifei on 15/3/7.
//  Copyright (c) 2015年 ZhiFei(qiuzhifei521@gmail.com). All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

#define EXAMPLE0 0
#define EXAMPLE1 0
#define EXAMPLE2 1

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // http://blog.sina.com.cn/s/blog_7124765801015imx.html
    
    // 对象归档是将对象归档以文件的形式保存到磁盘中(也称为序列化，持久化)，使用的时候读取该文件的保存路径读取文件的内容（也称为接档，反序列化），
    // （对象归档的文件是保密的，在磁盘上无法查看文件中的内容，而属性列表是明文的，可以查看）。
    // 对象归档有两种方式：1：对foundation中对象进行归档  2：自定义对象归档
    
#if EXAMPLE0
    NSString *homeDir = NSHomeDirectory();
    NSString *homePath = [homeDir stringByAppendingPathComponent:@"example.archiver"];
    NSLog(@"路径 == %@", homePath);
    
    NSArray *arr = @[@"1", @"我们的"];
    if ([NSKeyedArchiver archiveRootObject:arr toFile:homePath]) {
        NSLog(@"归档成功");
    }
    
    NSLog(@"读取归档 == %@", [NSKeyedUnarchiver unarchiveObjectWithFile:homePath]);
    
    NSData *content = [NSData dataWithContentsOfFile:homePath];
    
    NSLog(@"读取文档 == %@", [NSKeyedUnarchiver unarchiveObjectWithData:content]);
    
#endif
    
#if EXAMPLE1
    
    NSString *homeDir = NSHomeDirectory();
    NSString *homePath = [homeDir stringByAppendingPathComponent:@"example.archiver"];
    NSLog(@"路径 == %@", homePath);
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:@"zhifei" forKey:@"name"];
    [archiver encodeFloat:1.f forKey:@"float"];
    [archiver finishEncoding];
    [data writeToFile:homePath atomically:YES];
    
    NSData *content = [NSData dataWithContentsOfFile:homePath];
    NSKeyedUnarchiver *unarchkver = [[NSKeyedUnarchiver alloc] initForReadingWithData:content];
    NSString *name = [unarchkver decodeObjectForKey:@"name"];
    NSLog(@"name == %@", name);
    
#endif
    
#if EXAMPLE2
    
    NSString *homeDir = NSHomeDirectory();
    NSString *homePath = [homeDir stringByAppendingPathComponent:@"example.archiver"];
    NSLog(@"路径 == %@", homePath);
    
    Student *stu = [[Student alloc] init];
    stu.name = @"zhifei";
    stu.age = 1.f;
    
    if ([NSKeyedArchiver archiveRootObject:stu toFile:homePath]) {
        NSLog(@"归档成功");
    }
    
    Student *contentObj = [NSKeyedUnarchiver unarchiveObjectWithFile:homePath];
    NSLog(@"name == %@", contentObj.name);
    
    Student *copyStu = [stu copy];
    NSLog(@"copy name == %@", copyStu.name);
    
#endif
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
