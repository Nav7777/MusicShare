//
//  MAParser.h
//  MusicApp
//
//  Created by Krishna Kumar on 10/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAParser : NSObject

-(void)parseRespose:(NSData *)responseData completion:(void (^)(NSArray *songListArray, NSError *error))handler;

@end
