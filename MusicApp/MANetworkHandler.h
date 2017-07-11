//
//  MANetworkHandler.h
//  MusicApp
//
//  Created by Krishna Kumar on 10/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAModel.h"

@interface MANetworkHandler : NSObject

+ (id) getInstance;
-(void)getTopSongList:(NSString *)query withCompletionHandler:(void (^)(NSArray *MAModel,NSError *error))handler;

@end
