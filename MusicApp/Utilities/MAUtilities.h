//
//  MAUtilities.h
//  MusicApp
//
//  Created by Krishna Kumar on 09/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAUtilities : NSObject

+ (NSString*)encodeStringTo64:(NSString*)fromString;
+(NSString *)getAuthorizationToken;
+(NSString *)getBaseURL;
+(NSString *)getQueryForURL;
+(void)setQueryForURL:(NSString *)url;
+(void)storeAuthorizationToken;

@end
