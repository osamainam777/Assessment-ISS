//
//  NetworkManager.h
//  AssessmentApple
//
//  Created by Usama Inaam Rasheed on 2/22/23.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
+(NetworkManager*)sharedApiHandler;

typedef void(^GetAnnouncementListApiCallBlock)(id data,NSError *error);
- (void)loadData:(GetAnnouncementListApiCallBlock)getAnnouncementListApiCallBlock;

@end
