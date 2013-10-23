//
//  NSDate+Relative.h
//  twitter
//
//  Created by Robert Manson on 10/21/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//  Mostly taken from:
//  http://stackoverflow.com/questions/902950/iphone-convert-date-string-to-a-relative-time-stamp/6509076#6509076
//

#import <Foundation/Foundation.h>

@interface NSDate (NSDate_Relative)

-(NSString *)distanceOfTimeInWordsSinceDate:(NSDate *)aDate;
-(NSString *)distanceOfTimeInWordsToNow;

@end
