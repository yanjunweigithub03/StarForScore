//
//  Network.m
//  UI---异步加载
//
//  Created by lanou3g on 15/6/16.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Network.h"

@implementation Network

+ (void)receivedDataWithURLString:(NSString *)string method:(NSString *)method body:(NSString *)body block:(Block)block
{
    NSURL *url = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if ([method isEqualToString:@"POST"]) {
        [request setHTTPMethod:method];
        NSData *bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodyData];
        NSLog(@"%@",request);
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSLog(@"%@",data);
            id tempObj = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
            block(tempObj);
        }];
    }else
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id tempObj = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        block(tempObj);
    }];
    
}


@end
