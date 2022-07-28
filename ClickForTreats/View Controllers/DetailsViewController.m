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
    self.recipeTitleLabel.text = self.recipe[@"label"];
    NSString *baseURLString = @"...";
    NSString *fullPosterUrl = [baseURLString stringByAppendingString:_recipe[@"poster_path"]];
    NSURL *posterUrl = [NSURL URLWithString:fullPosterUrl];
    NSString *backdropUrl = [baseURLString stringByAppendingString:_recipe[@"backdrop_path"]];
    NSURL *backposterUrl = [NSURL URLWithString:backdropUrl];
    [self.posterImageView setImageWithURL:posterUrl];
    [self.backgroundImageView setImageWithURL:backposterUrl];
}

- (void)testWebPage {
    NSURL *url = [NSURL URLWithString:@"https://www.bbcgoodfood.com/recipes/green-salad-avocado"];
    NSString *webPage = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    self.textView.text = [Parser parseString:webPage].description;
}

@end
