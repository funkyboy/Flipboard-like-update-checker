//
//  SMUpdaterDelegate.h
//  Updater
//
//  Created by cesarerocchi on 5/19/12.
//  Copyright (c) 2012 Studio Magnolia. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SMUpdaterDelegate <NSObject>

- (void) requestFailedwithError:(NSError *) error;

@optional

- (void) newVersionExists:(NSString *)versionNumber;
- (void) thereIsNoNewVersion;

@end
