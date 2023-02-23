//
//  NetworkManager.m
//  AssessmentApple
//
//  Created by Usama Inaam Rasheed on 2/22/23.
//
#define GET_Service_Provider @"http://api.open-notify.org/iss-now.json"

#import "NetworkManager.h"
static NetworkManager *apiHandler;
@implementation NetworkManager
+(NetworkManager*)sharedApiHandler{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (!apiHandler) {
            apiHandler = [[NetworkManager alloc] init];
            
        }
    });
    
    return apiHandler;
}

- (void)loadData:(GetAnnouncementListApiCallBlock)getAnnouncementListApiCallBlock{
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:[self getURLRequestForServiceList] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            getAnnouncementListApiCallBlock(nil,error);
            
        } else {
            getAnnouncementListApiCallBlock(data,error);
        }
    }] resume];
}
#pragma mark - NSURLRequest
- (NSURLRequest*)getURLRequestForServiceList{
    
    NSURL *url = [NSURL URLWithString:GET_Service_Provider];
    
    NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:180];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    return request;
}
@end
