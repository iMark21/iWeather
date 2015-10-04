//
//  ViewController.m
//  iWeather
//
//  Created by Juan Miguel Marqués Morilla on 4/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "MMAPI.h"
#import "MMGeographicPlace.h"

//#define URL @"http://api.geonames.org/searchJSON?q=Madrid&maxRows=5&startRow=0&lang=en&isNameRequired=true&style=FULL&username=demo"
//
////http://api.geonames.org/weatherJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&username=demo
//
//#define url2 @"http://api.geonames.org/searchJSON?q=Madrid&maxRows=20&startRow=0&lang=en&isNameRequired=true&style=FULL&username=demo"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *parsedItems;

-(void)loadDataWithUrl:(NSString*)url;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self configureUI];
    
    
}
-(void)configureUI{
    
    self.titleLabel.text = NSLocalizedString(@"Search your city", @"");
    self.textField.placeholder = NSLocalizedString(@"Type here",@"");
    self.searchButton.titleLabel.text = NSLocalizedString(@"Search", @"");
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.textField.frame.size.height - 1, self.textField.frame.size.width, .5f);
    bottomBorder.backgroundColor = [UIColor blackColor].CGColor;
    [self.textField.layer addSublayer:bottomBorder];
    
    
}

-(void)loadDataWithUrl:(NSString*)url{
    
    [SVProgressHUD showWithStatus:@"Cargando" maskType:SVProgressHUDMaskTypeGradient];
    
    self.parsedItems = [NSMutableArray array];
    
    [[MMAPI sharedInstance]JSONArray:[NSURL URLWithString:url] completionBlock:^(NSArray *JSONArray, NSError *error) {
        
        if (!error) {
            
            for (id item in [JSONArray valueForKey:@"geonames"]) {
                
                if ([item isKindOfClass:[NSDictionary class]]) {
             
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // code here
                        MMGeographicPlace *place = [[MMGeographicPlace alloc] initWithDictionary:item];
                        
                        [self.parsedItems addObject:place];
                        
                        [self.tableView reloadData];
                        
                        [SVProgressHUD dismiss];
                        
                        NSLog(@"%@",place.name);
                    });
                   
                }
            }
            
            
        }
        
        
    }];
    
}



- (IBAction)searchButtonAction:(id)sender {
    
    //http://api.geonames.org/searchJSON?q=Madrid&maxRows=5&startRow=0&lang=en&isNameRequired=true&style=FULL&username=demo
    
    NSString *urlToSearch = [NSString stringWithFormat:@"http://api.geonames.org/searchJSON?q=%@&maxRows=20&startRow=0&lang=en&isNameRequired=true&style=FULL&username=ilgeonamessample",self.textField.text];
    
    [self loadDataWithUrl:urlToSearch];
    
 
    
    
    
}

#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.parsedItems count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    MMGeographicPlace *place = [self.parsedItems objectAtIndex:indexPath.row];
    cell.textLabel.text =  place.name;
   
    return cell;
}


@end
