//
//  Parser.m
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Parser.h"

@implementation Parser

+ (void)parseWeather:(NSDictionary*)json {
    //check for valid value
    if(json != nil){
        NSDictionary    *main = [json valueForKey: @"main"];
        float temp = [[main valueForKey: @"temp"]floatValue] - 273.15;
        float tempMax = [[main valueForKey: @"temp_max"]floatValue] - 273.15;
        float tempMin = [[main valueForKey: @"temp_min"]floatValue] - 273.15;
        NSString *humidity = [[main valueForKey: @"humidity"]stringValue];
        NSString *pressure = [[main valueForKey: @"pressure"]stringValue];
        
        mstTemp     = [NSString stringWithFormat:@"%.2f ºC", temp];
        mstHumidity = [humidity stringByAppendingString:@" %"];
        mstPressure = [pressure stringByAppendingString:@" mbar"];
        mstTempMax  = [NSString stringWithFormat:@"%.2f ºC", tempMax];
        mstTempMin  = [NSString stringWithFormat:@"%.2f ºC", tempMin];
    }
}

@end
