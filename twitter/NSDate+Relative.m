//
//  NSDate+Relative.m
//  twitter
//
//  Created by Robert Manson on 10/21/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "NSDate+Relative.h"

@implementation NSDate (NSDate_Relative)


-(NSString *)distanceOfTimeInWordsToNow {
    return [self distanceOfTimeInWordsSinceDate:[NSDate date]];
    
}

-(NSString *)distanceOfTimeInWordsSinceDate:(NSDate *)aDate {
    double interval = [self timeIntervalSinceDate:aDate];
    
    NSString *timeUnit;
    int timeValue;
    
    if (interval < 0) {
        interval = interval * -1;
    }
    
    if (interval< 60) {
        return @"seconds ago";
    } else if (interval< 3600) { // minutes
        timeValue = round(interval / 60);
        timeUnit = @"min";
        return [NSString stringWithFormat:@"%d %@", timeValue, timeUnit];
    } else if (interval< 86400) {  // hours
        timeValue = round(interval / 60 / 60);
        timeUnit = @"hr";
        return [NSString stringWithFormat:@"%d %@", timeValue, timeUnit];
    } else
    {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"MMM/dd/YY"];
        return [df stringFromDate:aDate];
    }
}

@end