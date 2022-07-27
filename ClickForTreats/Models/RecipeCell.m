//
//  RecipeCell.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/18/22.
//

#import "RecipeCell.h"
#import "UIImageView+AFNetworking.h"
#import "RecipeAPIManager.h"

@implementation RecipeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //self.likeButton.titleLabel.hidden = YES;
    //[self.likeButton addTarget:self action:@selector(didTapFavorite:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRecipe:(Recipe *)recipe {
    
    // Since we're replacing the default setter, we have to set the underlying private storage _recipe ourselves.
    // _recipe was an automatically declared variable with the @propery declaration.
    // You need to do this any time you create a custom setter.

    _recipe = recipe;
    self.titleLabel.text = self.recipe.title;
    self.posterView.image = nil;
    if (self.recipe.posterUrl != nil) {
        [self.posterView setImageWithURL:self.recipe.posterUrl];
    }
}

/*
- (IBAction)didTapFavorite:(id)sender {
    // Update the local tweet model
    if(self.recipe.favorited){
        self.recipe.favorited = NO;
        self.recipe.favoriteCount -= 1;
        
        // Send a POST request to the POST favorites/create endpoint
        [[RecipeAPIManager shared] unfavorite:self.recipe completion:^(Recipe *recipe, NSError *error) {
            if(error){
                NSLog(@"Error favoriting recipe: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following recipe: %@", recipe.text);
                [self.likeButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
                [self.likeCountLabel setText:[NSString stringWithFormat: @"%d", self.recipe.favoriteCount]];
            }
        }];
    }
    else {
        self.recipe.favorited = NO;
        self.recipe.favoriteCount += 1;
        
        // Send a POST request to the POST favorites/create endpoint
        [[RecipeAPIManager shared] favorite:self.recipe completion:^(Recipe *recipe, NSError *error) {
            if(error){
                NSLog(@"Error favoriting recipe: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following recipe: %@", tweet.text);
                [self.likeButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
                [self.likeCountLabel setText:[NSString stringWithFormat: @"%d", self.recipe.favoriteCount]];
            }
        }];
    }
}
*/

@end
