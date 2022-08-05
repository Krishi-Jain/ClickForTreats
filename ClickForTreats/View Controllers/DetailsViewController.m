//
//  DetailsViewController.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/8/22.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Parser.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stepsFromRecipe];
    
    self.recipeTitleLabel.text = self.recipe.title;
    // self.posterImageView.image = self.recipe.posterUrl;
    
    // creating and attaching the UILongPressGestureRecognizer instance to the instructions button
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.instructionsButton addGestureRecognizer:longPress];
}

- (void)stepsFromRecipe {
    NSURL *url = [NSURL URLWithString:@"https://www.bbcgoodfood.com/recipes/green-salad-avocado"];
    NSString *webPage = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//    NSDictionary *dict = [webPage substringFromIndex:0];
//    for (id text in [dict allKeys]) {
//        NSString *steps = dict[text];
//        NSLog(steps);
//    }
    self.textView.text = [Parser parseString:webPage].description;
}

// implementing the method that handles the long press gesture
- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
         NSLog(@"Long Press");
    }
    // TODO: add the code to display the website preview on the app once the user long presses the instructions button
}

- (IBAction)startFade:(id)sender {
    [self.recipeTitleLabel setAlpha:0.f];

    //fade in
    [UIView animateWithDuration:2.f delay:0.f options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.recipeTitleLabel setAlpha:1.f];
    } completion:^(BOOL finished) {
        //fade out
        [UIView animateWithDuration:2.f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.recipeTitleLabel setAlpha:0.f];
        } completion:nil];
    }];
}

@end
