//
//  RecipeCell.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/18/22.
//

#import "RecipeCell.h"
#import "UIImageView+AFNetworking.h"

@implementation RecipeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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

@end
