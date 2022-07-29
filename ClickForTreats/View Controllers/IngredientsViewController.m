//
//  IngredientsViewController.m
//  ClickForTreats
//
//  Created by Krishi Jain on 7/8/22.
//

#import "IngredientsViewController.h"

@interface IngredientsViewController () {
    NSIndexPath *previousIndexPath, *currentIndexPath;
}

@property (nonatomic, retain) NSMutableSet* checkedIndexPaths;

@end

@implementation IngredientsViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Preserving selection between presentation
    self.clearsSelectionOnViewWillAppear = NO;
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"Pantry"ofType:@"csv"];
    NSString *strFile = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    if (!strFile) {
        NSLog(@"Error reading file.");
    }
    
    NSMutableArray *lines = [NSMutableArray new];
    
    NSScanner *lineScanner = [NSScanner scannerWithString:strFile];
    do {
        NSString *line = nil;
        [lineScanner scanUpToString:@"\n" intoString:&line];
        NSMutableArray *items = [NSMutableArray new];
        for (NSString *item in [line componentsSeparatedByString:@","]) {
            if(item.length > 0) {
                [items addObject:item];
            }
        }
        [lines addObject:items.copy];
    } while (![lineScanner isAtEnd]);
    
    self.pantry = [lines copy];
    
    self.checkedIndexPaths = [NSMutableSet new];
}

-(void)viewWillAppear:(BOOL)animated {
    previousIndexPath = nil;
    currentIndexPath = nil;
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.pantry count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.pantry objectAtIndex:section] count] - 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.pantry objectAtIndex:section] firstObject];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"ingredientCell";
    IngredientCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        cell = [[IngredientCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ingredientCell"];
    }
    cell.textLabel.text = [[self.pantry objectAtIndex:indexPath.section] objectAtIndex:indexPath.row + 1];
    
    if([self.checkedIndexPaths containsObject:indexPath])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Uncheck the previous checked row
    if(self.checkedIndexPaths)
    {
        IngredientCell* uncheckCell = [tableView cellForRowAtIndexPath:indexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    if([self.checkedIndexPaths containsObject:indexPath])
    {
        [self.checkedIndexPaths removeObject:indexPath];
    }
    else
    {
        IngredientCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.checkedIndexPaths addObject:indexPath];
    }
}

@end
