//
//  UrlBuilderTest.m
//  ClickForTreatsTests
//
//  Created by Krishi Jain on 7/13/22.
//

#import <XCTest/XCTest.h>

#import "EdamamURLBuilder.h"
#import "Ingredient.h"

@interface UrlBuilderTest : XCTestCase

@end

@implementation UrlBuilderTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testURLBuilder {
    NSURL *testURL = [NSURL URLWithString:@"https://api.edamam.com/api/recipes/v2?type=public&q=chicken%2C%20tomate%2C%20onion&app_id=b105480b&app_key=e403614b5d3ef7099ca536339b321a94"];
    NSArray * ingredients = @[[[Ingredient alloc] initWithName:@"chicken" iconURL:NSURL.new],
                              [[Ingredient alloc] initWithName:@"tomate" iconURL:NSURL.new],
                              [[Ingredient alloc] initWithName:@"onion" iconURL:NSURL.new]];
    XCTAssert([[EdamamURLBuilder recipesWithIngredients:ingredients] isEqual:testURL]);
}

@end
