//
//  RecipeCell.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/18/22.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecipeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *calorieCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *ingredientsCountLabel;
@property (nonatomic, strong) Recipe *recipe;

@end

NS_ASSUME_NONNULL_END
