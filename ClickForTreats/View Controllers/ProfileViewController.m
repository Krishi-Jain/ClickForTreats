//
//  ProfileViewController.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/8/22.
//


#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "Post.h"

@interface ProfileViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *photosInProfile;

@end

@implementation ProfileViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
}

- (IBAction)setProfileImage:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void) setUser {
    PFUser *username = [PFUser currentUser];
    self.profileName.text = username.username;
}
 

@end
