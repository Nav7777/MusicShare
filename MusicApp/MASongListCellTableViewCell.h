//
//  MASongListCellTableViewCell.h
//  MusicApp
//
//  Created by Krishna Kumar on 11/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAModel.h"

@interface MASongListCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgArtistArt;
@property (weak, nonatomic) IBOutlet UILabel *lblSongName;
@property (weak, nonatomic) IBOutlet UILabel *lblArtistname;
@property (weak, nonatomic) IBOutlet UILabel *lblArtistAlbum;
@property (weak, nonatomic) IBOutlet UIImageView *imgPlayIndicator;

-(void)cellWithData:(MAModel *)songObject;

@end
