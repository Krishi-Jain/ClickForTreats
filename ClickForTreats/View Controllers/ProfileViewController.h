//
//  ProfileViewController.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/8/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (nonatomic, strong) Post *post;

@end

NS_ASSUME_NONNULL_END
