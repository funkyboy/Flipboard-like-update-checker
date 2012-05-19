//
//  SMURLConnection.h
//  iCataloghi
//
//  Created by cesarerocchi on 2/15/11.
//  Copyright 2011 studiomagnolia.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SMURLConnection : NSURLConnection



@property (nonatomic, strong) NSMutableData* data;


- (id)initWithRequest:(NSURLRequest *)request 
			 delegate:(id)delegate;


@end

