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
    [[[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:songObject.albumArt]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgArtistArt.image = [UIImage imageWithData:data];
        });
    }] resume];
}
@end
