//
//  ViewController.m
//  RUNTIME
//
//  Created by 高帅 on 2017/5/22.
//  Copyright © 2017年 高帅. All rights reserved.
//

#import "ViewController.h"

#import "MyView.h"
#import "UIView+extension.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [[Person alloc] init];
    //[p foo:@"吃饭"];
    
    [Person eat];
    //p.foo;
    /*
     NSData *data = [@"34" dataUsingEncoding:NSUTF8StringEncoding];
     NSLog(@"data === %@  data.length=== %zd ",data,data.length);
     NSData *resultData = [data subdataWithRange:NSMakeRange(1, 1)];
     NSLog(@"resultData == %@",resultData);
     Byte *resultByte = (Byte *)[resultData bytes];
     NSLog(@"resultByte=== %s",resultByte);
     
     int i = resultByte[0];
     NSLog(@"i-==== %zd  ",i);
     
     int a = 10 ? 1: 3;
     NSLog(@"%zd",a);
     */
    
    MyView *my = [[MyView alloc] init];
    
    
    [my sTapActionWithBlock:^{
        NSLog(@"ddfafa");
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [my __handleActionForTapGesture:tap];
    
    
}

- (void)tap{
    NSLog(@"tap");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
