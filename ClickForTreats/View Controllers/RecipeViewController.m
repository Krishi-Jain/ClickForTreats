//
//  RecipeViewController.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/12/22.
//

#import "RecipeViewController.h"
#import "RecipeApiManager.h"
#import "RecipeCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"
#import "Recipe.h"


@interface RecipeViewController ()

@property (nonatomic, strong) NSMutableArray *recipes;
@property (strong, nonatomic) NSArray *filteredData;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityIndicator startAnimating];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchRecipes];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchRecipes) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (void)fetchRecipes{
    self.filteredData = self.recipes;
    
    // UI alert
    UIAlertController *networkAlert = [UIAlertController alertControllerWithTitle:@"Cannot Get Recipes" message:@"The internet connection appears to be offline" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *tryAgainAction = [UIAlertAction actionWithTitle:@"Try Agin" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self fetchRecipes];
    }];
    
    [networkAlert addAction:tryAgainAction];
    
    NSURL *url = [NSURL URLWithString:@"https://api.edamam.com/api/recipes/v2?api_key=e403614b5d3ef7099ca536339b321a94"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
               
               //Alert UI
               [self presentViewController:networkAlert animated:YES completion:^{
                   //Optional code for after alert controller has finished presenting
               }];
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               
               // new is an alternative syntax to calling alloc init.
               RecipeApiManager *manager = [RecipeApiManager new];
               [manager fetchNowDisplaying:^(NSArray *recipes, NSError *error) {
                   self.recipes = recipes;
                   [self.tableView reloadData];
               }];

               // TODO: Get the array of recipes
               NSLog(@"%@", dataDictionary); // log an object with the %@ formatter.

               /*
               // TODO: Store the recipes in a property to use elsewhere
               self.recipes = dataDictionary[@"results"];
               self.filteredData = dataDictionary[@"results"];
               
               // TODO: Reload your table view data
               [self.tableView reloadData];
               */
           }
           [self.refreshControl endRefreshing];
           [self.activityIndicator stopAnimating];
       }];
    [task resume];
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
    (NSInteger)section{
    return self.recipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecipeCell"];
    cell.recipe = self.recipes[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    UITableViewCell *cell = sender;
    NSIndexPath *myIndexPath = [self.tableView indexPathForCell:cell];
    // Pass the selected object to the new view controller.
    NSDictionary *recipe = self.recipes[myIndexPath.row];
    DetailsViewController *detailVC = [segue destinationViewController];
    detailVC.recipe = recipe;
}

@end
