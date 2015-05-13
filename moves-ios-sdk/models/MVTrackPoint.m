//
//  MVTrackPoints.m
//  Move-iOS-SDK
//
//  Created by Vito on 13-7-11.
//  Copyright (c) 2013年 vito. All rights reserved.
//

#import "MVTrackPoint.h"
#import "DFDateFormatterFactory.h"
#import "MVJsonValueParser.h"

@implementation MVTrackPoint

- (MVTrackPoint *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    
    if (self && [dic isKindOfClass:[NSDictionary class]]) {
        if (dic[@"lat"]) {
            _lat = [MVJsonValueParser floatValueFromObject:dic[@"lat"]];
        }
        if (dic[@"lon"]) {
            _lon = [MVJsonValueParser floatValueFromObject:dic[@"lon"]];
        }
        
        NSString *time = [MVJsonValueParser stringValueFromObject:dic[@"time"]];
        if (time) {
            NSDateFormatter *formatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"yyyyMMdd'T'HHmmssZ"];
            formatter.calendar = [MVCalendarFactory calendarWithIdentifier:NSGregorianCalendar];
            _time = [formatter dateFromString:time];
        }
    }
    
    return self;
}


@end
