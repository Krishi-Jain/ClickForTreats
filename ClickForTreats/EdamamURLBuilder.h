//
//  EdamamURLBuilder.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/12/22.
//

#import <Foundation/Foundation.h>

@class Ingredient;

NS_ASSUME_NONNULL_BEGIN

// define your keys here

@interface EdamamURLBuilder: NSObject

+(NSURL *) recipesWithIngredients:(NSArray <Ingredient *>*)ingredients;

@end

NS_ASSUME_NONNULL_END
