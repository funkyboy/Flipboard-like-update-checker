//
//  SMAppDelegate.h
//  Updater
//
//  Created by cesarerocchi on 5/19/12.
//  Copyright (c) 2012 Studio Magnolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMUpdaterDelegate.h"

@class SMViewController;

@interface SMAppDelegate : UIResponder <UIApplicationDelegate, SMUpdaterDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SMViewController *viewController;

@end
