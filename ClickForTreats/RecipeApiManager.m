//
//  RecipeApiManager.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/12/22.
//

#import "RecipeApiManager.h"
#import "Recipe.h"

@interface RecipeApiManager()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation RecipeApiManager

- (id)init {
    self = [super init];
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    return self;
}

- (void)fetchNowDisplaying:(void(^)(NSArray *recipes, NSError *error))completion {
    NSURL *url = [NSURL URLWithString:@"https://api.edamam.com/api/recipes/v2?api_key=e403614b5d3ef7099ca536339b321a94"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);

            // The network request has completed, but failed.
            // Invoke the completion block with an error.
            // Think of invoking a block like calling a function with parameters
            completion(nil, error);
        }
        else {
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

            NSArray *dictionaries = dataDictionary[@"results"];
            NSArray *recipes = [Recipe recipesWithDictionaries:dictionaries];

            // The network request has completed, and succeeded.
            // Invoke the completion block with the movies array.
            // Think of invoking a block like calling a function with parameters
            completion(recipes, nil);
        }
    }];
    [task resume];
}

@end
