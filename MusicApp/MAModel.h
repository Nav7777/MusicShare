//
//  MAModel.h
//  MusicApp
//
//  Created by Krishna Kumar on 10/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *albumName;
@property (nonatomic, strong) NSString *albumArt;
@property (nonatomic, strong) NSString *songURL;
@property (nonatomic, strong) NSString *storeID;
@end
