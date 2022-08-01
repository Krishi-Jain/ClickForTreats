//
//  IngredientsViewController.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/8/22.
//

#import <UIKit/UIKit.h>
#import "IngredientCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface IngredientsViewController : UITableViewController

@property (nonatomic, strong) NSArray *pantry;

@end

NS_ASSUME_NONNULL_END
