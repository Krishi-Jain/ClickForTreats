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
    
    self.title = dictionary[@"..."];
    self.caloriesCount = dictionary[@"calories"];
    self.ingredientsCount = dictionary[@"..."];
    
    return self;
}

+ (NSArray <Recipe *> *)recipesWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *recipes = [[NSMutableArray alloc] init];
    // Implement this function
    for (NSDictionary *dictionary in dictionaries) {
        // Calling the Movie initializer here
        Recipe *recipe = [[Recipe alloc] initWithDictionary:dictionary];

        [recipes addObject:recipe];
    }
    return recipes.copy;
}

@end
