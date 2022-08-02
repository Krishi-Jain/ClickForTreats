//
//  ProfileViewController.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/8/22.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "ProfileCollectionViewCell.h"
#import "Post.h"

@interface ProfileViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

/*
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *photosInProfile;

@end

@implementation ProfileViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[UICollectionView class] forCellWithReuseIdentifier:reuseIdentifier];
    [self getPostsCollections];
}

- (void)getPostsCollections {
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts!=nil) {
            self.photosInProfile = posts;
            [self.collectionView reloadData];
        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photosInProfile.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProfileCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileViewCell" forIndexPath:indexPath];
    Post *postForCollection = self.photosInProfile[indexPath.row];
    cell.post = postForCollection;
    [self setUser];
    return cell;
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"collectionDetails"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        ProfileViewController *collectionViewController = (ProfileViewController*)navigationController.topViewController;
        UICollectionViewCell *cell = sender;
        NSIndexPath *indexpath = [self.collectionView indexPathForCell:cell];
        Post *post = self.photosInProfile[indexpath.row];
        collectionViewController.post = post;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    CGSize cellSize = width/3;
    CGSize size = CGSizeMake(cellSize, cellSize);
    return size;
}
 */

@end
