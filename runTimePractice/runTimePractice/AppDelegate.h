//
//  AppDelegate.h
//  runTimePractice
//
//  Created by 高帅 on 2017/5/27.
//  Copyright © 2017年 高帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

