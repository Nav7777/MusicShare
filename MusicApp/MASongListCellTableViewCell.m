//
//  MASongListCellTableViewCell.m
//  MusicApp
//
//  Created by Krishna Kumar on 11/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import "MASongListCellTableViewCell.h"

@implementation MASongListCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cellWithData:(MAModel *)songObject;
{
    self.lblSongName.text=songObject.albumName;
    self.lblArtistname.text=songObject.artist;
    self.lblArtistAlbum.text=songObject.albumName;
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:songObject.albumArt]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        self.imgArtistArt.image = [UIImage imageWithData:data];
    }];
}
@end
