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

/*
- (void)favorite:(Recipe *)recipe completion:(void (^)(Recipe *, NSError *))completion {
    NSString *urlString = @"1.1/favorites/create.json";
    NSDictionary *parameters = @{@"id": recipe.idStr};
    [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable recipeDictionary) {
        Recipe *recipe = [[Recipe alloc]initWithDictionary:recipeDictionary];
        completion(recipe, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completion(nil, error);
    }];
 */
 
@end

NS_ASSUME_NONNULL_END
