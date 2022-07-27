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
    
    // Displaying an Edit button in the navigation bar for this view controller
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IngredientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ingredientCell" forIndexPath:indexPath];
    cell.ingredientLabel.text = [NSString stringWithFormat:@"Cell %i", indexPath.row];
    cell.checkmarkImageViewAccessory.hidden = YES;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    currentIndexPath = indexPath;
    IngredientCell *cell = nil;
    if (!previousIndexPath) {
        previousIndexPath = currentIndexPath;
    }
    if (previousIndexPath != currentIndexPath) {
        //cell = (IngredientCell *) [tableView cellForRowAtIndexPath:previousIndexPath];
        //cell.checkmarkImageViewAccessory.transform = CGAffineTransformMakeScale(0, 0);
        //cell = (IngredientCell *) [tableView cellForRowAtIndexPath:currentIndexPath];
        cell = (IngredientCell *) [tableView cellForRowAtIndexPath:indexPath];
        cell.checkmarkImageViewAccessory.hidden = NO;
        cell.checkmarkImageViewAccessory.transform = CGAffineTransformMakeScale(0, 0);
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            cell.checkmarkImageViewAccessory.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
        previousIndexPath = currentIndexPath;
    }
    if (previousIndexPath == currentIndexPath) {
        cell = (IngredientCell *) [tableView cellForRowAtIndexPath:previousIndexPath];
        cell.checkmarkImageViewAccessory.hidden = NO;
        cell.checkmarkImageViewAccessory.transform = CGAffineTransformMakeScale(0, 0);
        
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            cell.checkmarkImageViewAccessory.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}

/*
- (void)createPantry {
    NSString * csv = @"I,am,a\nc,s,v";
    NSMutableArray *values = [NSMutableArray new];
    for (NSString *line in [csv componentsSeparatedByString:@"\n"]) {
        [values addObject:[line componentsSeparatedByString:@","]];
    }
    self.textView.text = values.description;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
