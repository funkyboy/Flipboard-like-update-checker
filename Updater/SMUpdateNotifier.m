//
//  SMUpdateNotifier.m
//  Updater
//
//  Created by cesarerocchi on 5/19/12.
//  Copyright (c) 2012 Studio Magnolia. All rights reserved.
//

#import "SMUpdateNotifier.h"
#import "SMUpdaterDelegate.h"


@implementation SMUpdateNotifier

@synthesize versionURL;
@synthesize connection;
@synthesize delegate = _delegate;

- (id) initWithDelegate:(id) del {

    if (self = [super init]) {
    
        _delegate = del;
        
    }
    
    return self;
    
}

- (NSString *) getCurrentVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
}

- (void) checkIfNewVersionExists {

    self.versionURL = [NSURL URLWithString:REMOTE_VERSION_FILE];
    NSURLRequest * request = [NSURLRequest requestWithURL:self.versionURL 
                                              cachePolicy:NSURLRequestReturnCacheDataElseLoad 
                                          timeoutInterval:60];
    self.connection = [[SMURLConnection alloc] initWithRequest:request delegate:self];
    
    if (!self.connection) {
    
        NSLog(@"error in connection");
    
    }
    
}



#pragma mark Url Callback methods

- (void)connection:(SMURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	
    [self.connection.data setLength:0];
	
}


- (void)connection:(SMURLConnection *)connection didFailWithError:(NSError *)error {
	
    [self.delegate requestFailedwithError:error];
	
}


- (void)connectionDidFinishLoading:(SMURLConnection *)conn {
	
    NSString *resString = [[NSString alloc] 
                           initWithData:conn.data 
                           encoding:NSUTF8StringEncoding];
    
    if ([resString hasPrefix:@"<"]) {
    
        NSLog(@"This is likely file not found");
        return;
        
    }
    
    NSComparisonResult comparisonResult = [resString compare:[self getCurrentVersion] 
                                                     options:NSNumericSearch];
    
    if (comparisonResult == 1) {
    
        [self.delegate newVersionExists:resString];
        
    }
	
}


- (void)connection:(SMURLConnection *)connection didReceiveData:(NSData *)data {
	
    [self.connection.data appendData:data];
	
}

@end
