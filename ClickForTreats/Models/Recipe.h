//
//  Recipe.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/14/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Recipe : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSURL *posterUrl;
@property (nonatomic, strong, readonly) NSString *caloriesCount;
@property (nonatomic, strong, readonly) NSString *ingredientsCount;
@property (nonatomic, strong, readonly) NSURL *webURL;
@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, strong, readonly) NSArray *healthLabels;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)recipesWithDictionaries:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
