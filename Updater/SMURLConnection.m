//
//  SMURLConnection.m
//  iCataloghi
//
//  Created by cesarerocchi on 2/15/11.
//  Copyright 2011 studiomagnolia.com. All rights reserved.
//

#import "SMURLConnection.h"


@implementation SMURLConnection

@synthesize data;


- (id)initWithRequest:(NSURLRequest *)request 
			 delegate:(id)delegate {
	
    if (self = [super initWithRequest:request delegate:delegate]) {
		
        data = [[NSMutableData alloc] initWithCapacity:0];
		
    }
    
    return self;
}




@end

