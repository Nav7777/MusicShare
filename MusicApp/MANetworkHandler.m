//
//  MANetworkHandler.m
//  MusicApp
//
//  Created by Krishna Kumar on 10/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import "MANetworkHandler.h"
#import "MAUtilities.h"
#import "MAParser.h"

@implementation MANetworkHandler

static MANetworkHandler *networkHandler;

+ (id) getInstance
{
    @synchronized(self)
    {
        if (networkHandler == nil)
        {
            networkHandler = [[self alloc]init];
        }
    }
    return networkHandler;
}

-(void)getTopSongList:(NSString *)query withCompletionHandler:(void (^)(NSArray *MAModel,NSError *error))handler
{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[MAUtilities getBaseURL],[MAUtilities getQueryForURL]]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:[MAUtilities getAuthorizationToken] forHTTPHeaderField:@"Authorization"];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                if (!error) {
                    MAParser *parser=[[MAParser alloc] init];
                    [parser parseRespose:data completion:^(NSArray *songListArray, NSError *error) {
                        handler(songListArray,error);
                    }];
                }
                else{
                    handler(nil,error);
                }
                
            }] resume];
}

@end
