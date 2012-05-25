//
//  SMUpdateNotifier.h
//  Updater
//
//  Created by cesarerocchi on 5/19/12.
//  Copyright (c) 2012 Studio Magnolia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMUpdaterDelegate.h"
#import "SMURLConnection.h"

#define APPNAME @"AppName"
#define REMOTE_VERSION_FILE @"http://localhost/version.txt"

@interface SMUpdateNotifier : NSObject

@property (nonatomic, strong) NSURL *versionURL;
@property (weak, readonly) id <SMUpdaterDelegate> delegate;
@property (nonatomic, strong) SMURLConnection *connection;

- (id) initWithDelegate:(id) del;
-(NSString *) getCurrentVersion;
- (void) checkIfNewVersionExists;

@end
