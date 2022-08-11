//
//  Post.h
//  ClickForTreats
//
//  Created by Krishi Jain on 8/11/22.
//

#import <Parse/Parse.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) PFFileObject *image;

+ (void)postUserImage: (UIImage * _Nullable)image withCaption: (NSString * _Nullable)caption withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
