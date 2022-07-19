//
//  RecipeApiManager.h
//  ClickForTreats
//
//  Created by Krishi Jain on 7/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecipeApiManager : NSObject
- (void)fetchNowDisplaying:(void(^)(NSArray *recipes, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
