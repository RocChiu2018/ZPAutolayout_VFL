//
//  ViewController.m
//  代码实现Autolayout-VFL
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 sunco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test1];
    
//    [self test2];
}

-(void)test1
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //间距
    NSNumber *margin = @20;
    
    //设置水平方向的约束
    NSString *vfl = @"H:|-margin-[blueView]-margin-|";
    
    /**
     设置字典：
     NSDictionaryOfVariableBindings这个宏可以自动生成对应的键值对，传入的参数最好和控件的名称一样。
     */
    NSDictionary *metrics = NSDictionaryOfVariableBindings(margin);
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView);
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:constraints];
    
    //高度
    NSNumber *height = @40;
    
    //设置竖直方向的约束
    NSString *vfl2 = @"V:|-margin-[blueView(height)]";
    
    //设置字典：
    NSDictionary *metrics2 = NSDictionaryOfVariableBindings(margin, height);
    
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:metrics2 views:views];
    [self.view addConstraints:constraints2];
}

-(void)test2
{
    //蓝色视图
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //红色视图
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    //间距
    NSNumber *margin = @20;
    
    //设置水平方向的约束
    NSString *vfl = @"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|";
    
    //设置字典
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView, redView);
    NSDictionary *mertrics = NSDictionaryOfVariableBindings(margin);
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:kNilOptions metrics:mertrics views:views];
    [self.view addConstraints:constraints];
    
    //高度
    NSNumber *height = @40;
    
    //设置竖直方向的约束
    NSString *vfl2 = @"V:[blueView(height)]-margin-|";
    
    //设置字典
    NSDictionary *mertrics2 = NSDictionaryOfVariableBindings(margin, height);
    
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:mertrics2 views:views];
    [self.view addConstraints:constraints2];
    
    /**
     有的时候只用VFL语言不能完全约束控件，还需要用其他方式补充约束；
     下面用户其他方式来补充约束红色视图。
     */
    NSLayoutConstraint *redConstraint1 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *redConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self.view addConstraint:redConstraint1];
    [self.view addConstraint:redConstraint2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
