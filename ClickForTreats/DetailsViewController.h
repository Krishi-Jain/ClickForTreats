//
//  DetailsViewController.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//recipeTitleLabel
//caloriesLabel
//ingredientsLabel

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) NSDictionary *recipe;
@property (weak, nonatomic) IBOutlet UILabel *recipeTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

NS_ASSUME_NONNULL_END
