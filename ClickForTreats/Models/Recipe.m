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
        self.title = dictionary[@"label"];
        self.caloriesCount = dictionary[@"calories"];
        self.ingredientsCount = dictionary[@"ingredientLines"];
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
