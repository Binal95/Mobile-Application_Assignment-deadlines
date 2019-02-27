//
//  AppDelegate.h
//  ass3
//
//  Created by Patel, Binal Shaileshkumar on 10/25/18.
//  Copyright © 2018 Patel, Binal Shaileshkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

