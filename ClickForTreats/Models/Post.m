//
//  Post.m
//  ClickForTreats
//
//  Created by Krishi Jain on 8/1/22.
//

#import "Post.h"
#import <Parse/Parse.h>

@implementation Post

/*
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void)postUserImage: (UIImage * _Nullable)image withCaption: (NString * _Nullable)caption withCompletion: (PFBooleanResultBlock _Nullable)completion {
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage *_Nullable)image {
    if (!image) {
        return nil;
    }
    NSData *imageData = UIImagePNGRepresentation(image);
    if (!imageData) {
        return nil;
    }
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}
 */

@end
