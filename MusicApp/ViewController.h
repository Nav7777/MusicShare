//
//  ViewController.h
//  MusicApp
//
//  Created by Krishna Kumar on 07/07/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewContolMedia;
- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;

@end

