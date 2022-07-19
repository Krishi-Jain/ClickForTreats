//
//  Recipe.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/14/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Recipe : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *posterUrl;
@property (nonatomic, strong) NSString *caloriesCount;
@property (nonatomic, strong) NSString *ingredientsCount;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)recipesWithDictionaries:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
