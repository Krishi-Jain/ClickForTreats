//
//  RecipeViewController.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/12/22.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecipeViewController : UITableViewController

@property (nonatomic, strong) Recipe *recipe;
@property (nonatomic, strong) NSArray *ingredients;
@property (nonatomic, strong) NSDictionary *dataDictionary;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;

@end

NS_ASSUME_NONNULL_END
