//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)screenName {
    if (self.data[@"user"])
    {
        return self.data[@"user"][@"screen_name"];
    }
    return nil;
}

- (NSString *)name {
    if (self.data[@"user"])
    {
        return self.data[@"user"][@"name"];
    }
    return nil;
}

- (NSString *)profileImageUrl {
    if (self.data[@"user"])
    {
        return self.data[@"user"][@"profile_image_url"];
    }
    return nil;
}

- (NSDate *)createdAt {
    return [Tweet convertTwitterDateToNSDate: self.data[@"created_at"]];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

# pragma mark - Private

+(NSDate*)convertTwitterDateToNSDate:(NSString*)created_at
{
    // Sat, 11 Dec 2010 01:35:52 +0000
    static NSDateFormatter* df = nil;
    
    df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:NSDateFormatterFullStyle];
    [df setFormatterBehavior:NSDateFormatterBehavior10_4];
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    
    return [df dateFromString:created_at];
}

@end
