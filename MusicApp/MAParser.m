//
//  MAParser.m
//  MusicApp
//
//  Created by Krishna Kumar on 10/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import "MAParser.h"
#import "MAModel.h"
#import "MAUtilities.h"

@implementation MAParser

-(void)parseRespose:(NSData *)responseData completion:(void (^)(NSArray *songListArray, NSError *error))handler
{
    if (responseData) {
        NSError *error = nil;
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
        if (error == nil) {
            
            NSDictionary *result=[jsonObject objectForKey:@"results"];
            NSArray *songs=[result objectForKey:@"songs"];
            NSDictionary *data=[songs firstObject];
            NSArray *songList=[data objectForKey:@"data"];
            [MAUtilities setQueryForURL:[data objectForKey:@"next"]];
            NSMutableArray *list=[[NSMutableArray alloc] init];
            if(songList.count>0)
            {
                for(int i=0;i<[songList count];i++){
                    NSDictionary *attributes=[[songList objectAtIndex:i] objectForKey:@"attributes"];
                    NSDictionary *artWork=[attributes objectForKey:@"artwork"];
                MAModel *model=[[MAModel alloc] init];
                    model.albumArt= [[artWork objectForKey:@"url"] stringByReplacingOccurrencesOfString:@"{w}x{h}" withString:@"90x90"];
                    model.albumName=[attributes objectForKey:@"name"];
                    model.artist=[attributes objectForKey:@"artistName"];
                    model.title=[attributes objectForKey:@"type"];
                    model.songURL=[attributes objectForKey:@"url"];
                    NSDictionary *playParam=[attributes objectForKey:@"playParams"];
                    model.storeID=[playParam objectForKey:@"id"];
                    [list addObject:model];
                }
                handler(list,error);
                return;
            
            }
            else{
                NSError *responseError = [NSError errorWithDomain:@"Error fetching list of songs" code:[[jsonObject valueForKey:@"errorCode"] integerValue] userInfo:[jsonObject valueForKey:@"failureReason"]];
                handler(nil,responseError);
            }
        }
        handler(nil,error);
    }
}

@end
