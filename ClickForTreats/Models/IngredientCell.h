//
//  IngredientCell.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/26/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IngredientCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *checkmarkImageViewAccessory;
@property (weak, nonatomic) IBOutlet UILabel *ingredientLabel;

@end

NS_ASSUME_NONNULL_END
