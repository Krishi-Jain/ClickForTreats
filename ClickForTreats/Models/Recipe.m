//
//  Recipe.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/14/22.
//

#import "Recipe.h"

@implementation Recipe

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self != nil) {
        _title = dictionary[@"label"];
        _caloriesCount = [@([dictionary[@"calories"] integerValue]) stringValue];
        _ingredientsCount = [@([dictionary[@"ingredientLines"] count]) stringValue];
        _healthLabels  = dictionary[@"healthLabels"];
        NSURL *imageURL = [NSURL URLWithString:dictionary[@"images"][@"REGULAR"][@"url"]];
        _image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
        _webURL = [NSURL URLWithString:dictionary[@"url"]];
    }
    return self;
}

+ (NSArray <Recipe *> *)recipesWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *recipes = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in dictionaries) {
        // Calling the Recipe initializer here
        Recipe *recipe = [[Recipe alloc] initWithDictionary:dictionary];
        [recipes addObject:recipe];
    }
    return recipes.copy;
}

@end
