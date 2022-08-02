//
//  EdamamURLBuilder.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/12/22.
//

#import "EdamamURLBuilder.h"
#import "Ingredient.h"

@implementation EdamamURLBuilder


/// EdamamURLBuilder builds the an API URL Path (an address that allows you to access an API and its various features)
/// @param ingredients NSArray used to store the list of ingredients selected by the user

+(NSURL *)recipesWithIngredients:(NSArray <Ingredient *>*)ingredients {
    //build the URL (NSString with format)
    NSMutableString *urlString = [[NSMutableString alloc] init];
    [urlString appendString:@"https://api.edamam.com/api/recipes/v2?type=public&q="];
    for (Ingredient *item in ingredients) {
        BOOL isLastItem = [ingredients indexOfObject:item] == ingredients.count - 1;
        [urlString appendFormat:@"%@%@", item.name, isLastItem ? @"": @"%2C%20"];
    }
    [urlString appendString:@"&app_id=b105480b&app_key=e403614b5d3ef7099ca536339b321a94"];
    return [NSURL URLWithString:urlString];
}

@end
