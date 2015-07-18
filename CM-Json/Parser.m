//
//  Parser.m
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Parser.h"
#import <UIKit/UIKit.h>

@implementation Parser

+ (void)parseWeather:(NSDictionary*)json {
    //check for valid value
    if(json != nil){
        NSDictionary    *main = [json valueForKey: @"main"];
        NSDictionary    *sys = [json valueForKey: @"sys"];
        NSString *place      = [json valueForKey: @"name"];
        NSLog(@"place content::: %@", place);
        NSLog(@"sys content::: %@", sys);
        NSDictionary    *weath = [json valueForKey: @"weather"];
        NSLog(@"weather content::: %@", weath);
        float temp = [[main valueForKey: @"temp"]floatValue] - 273.15;
        float tempMax = [[main valueForKey: @"temp_max"]floatValue] - 273.15;
        float tempMin = [[main valueForKey: @"temp_min"]floatValue] - 273.15;
        NSString *humidity = [[main valueForKey: @"humidity"]stringValue];
        NSString *pressure = [[main valueForKey: @"pressure"]stringValue];
        //NSString *wIcon    = [weath valueForKey:@"icon"];
        NSString *wIcon    = @"01n";
        NSLog(@"Icon code %@", wIcon);
        NSString *url      = @"http://openweathermap.org/img/w/";
        NSString *ext      = @".png";
        NSString *complURL = [@[url, wIcon, ext] componentsJoinedByString:@""];
        NSLog(@"Complete URL %@", complURL);
        
        mstTemp     = [NSString stringWithFormat:@"%.2f ºC", temp];
        mstHumidity = [humidity stringByAppendingString:@" %"];
        mstPressure = [pressure stringByAppendingString:@" mbar"];
        mstTempMax  = [NSString stringWithFormat:@"%.2f ºC", tempMax];
        mstTempMin  = [NSString stringWithFormat:@"%.2f ºC", tempMin];
        wImage      = [self getImageFromURL:complURL];
        mstPlace    = [json valueForKey: @"name"];
        NSLog(@"mstPlace cont: %@", mstPlace);
        mstCountry  = [sys valueForKey: @"country"];

        
    }
}

+ (UIImage *) getImageFromURL:(NSString *)fileURL {
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}

@end
