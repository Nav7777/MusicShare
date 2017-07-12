//
//  MAUtilities.m
//  MusicApp
//
//  Created by Krishna Kumar on 09/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import "MAUtilities.h"
#import "KeychainWrapper.h"

@implementation MAUtilities

static NSString *query=@"v1/catalog/au/charts?types=songs&offsets=20";

+ (NSString*)encodeStringTo64:(NSString*)fromString
{
    NSData *plainData = [fromString dataUsingEncoding:NSUTF8StringEncoding];
    return [plainData base64EncodedStringWithOptions:kNilOptions];
}

+(NSString *)getBaseURL
{
    return @"https://api.music.apple.com/";
}

+(NSString *)getQueryForURL
{
    return query;
}

+(void)setQueryForURL:(NSString *)url
{
    if(url){
    query=url;
    }
    else{
        query=@"v1/catalog/au/charts?types=songs&offsets=20";
    }
}

+(void)storeAuthorizationToken
{
    KeychainWrapper* keychain = [[KeychainWrapper alloc] init ];
    [keychain mySetObject:@"Bearer eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjhGUTVDWTRQMk0ifQ.eyJpc3MiOiJKNzI4NU1YMjI5IiwiaWF0IjoxNDk5NzUxNjQzLCJleHAiOjE1MTUzMDM2NDN9.PxlhSei6uFb3GhHV1PX6OHyO80Yfy4M26KRBKEB6AX6gF_rLtCl8Cvm9ClbbRKspuqIwGS9y9aXZFdi9GSkA-g" forKey:kSecValueData];
    [keychain writeToKeychain];
}

+(NSString *)getAuthorizationToken
{
    KeychainWrapper* keychain = [[KeychainWrapper alloc] init ];
    return [keychain myObjectForKey:kSecValueData];
}



@end
