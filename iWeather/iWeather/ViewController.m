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
#import "MMDetailViewController.h"


@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *parsedItems;

@property (nonatomic, strong) NSArray *cachedItems;

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

-(void)loadDataWithUrl:(NSString*)placeString{
    
    [SVProgressHUD showWithStatus:@"Cargando" maskType:SVProgressHUDMaskTypeGradient];
    
    self.parsedItems = [NSMutableArray array];
    
    [[MMAPI sharedInstance] queryPlacesWithString:placeString completionBlock:^(NSArray *JSONArray, NSError *error) {
       
        
        if (!error) {
            
            if ([[JSONArray valueForKey:@"geonames"] count]==0 || JSONArray == nil) {
                
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"Ooops!"                                                  message:NSLocalizedString(@"Something goes wrong. Please search another place", @"")
                                              preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *cancelButton = [UIAlertAction
                                               actionWithTitle:@"Ok"
                                               style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action)
                                               {
                                                   [alert dismissViewControllerAnimated:YES completion:nil];
                                                   
                                               }];
                
                [alert addAction:cancelButton];
                
                [self presentViewController:alert animated:YES completion:nil];

            
            
            }else{
                
                for (id item in [JSONArray valueForKey:@"geonames"]) {
                    
                    if ([item isKindOfClass:[NSDictionary class]]) {
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            MMGeographicPlace *place = [[MMGeographicPlace alloc] initWithDictionary:item];
                            
                            [self.parsedItems addObject:place];
                            
                            [self.tableView reloadData];
                            
                           
                        });
                        
                    }
                }

            }
            
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [SVProgressHUD dismiss];
            
        });

    }];
}


- (IBAction)searchButtonAction:(id)sender {

    if ([self.textField.text length]==0) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Ooops!"                                                  message:NSLocalizedString(@"You have to enter a place", @"")
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelButton = [UIAlertAction
                                       actionWithTitle:@"Ok"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           [alert dismissViewControllerAnimated:YES completion:nil];
                                           
                                       }];
        
        [alert addAction:cancelButton];
        
        [self presentViewController:alert animated:YES completion:nil];

    }
    
    [self loadDataWithUrl:self.textField.text];
    
    
}



#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    if (self.parsedItems.count == 0 || self.parsedItems == nil) {
    
        self.parsedItems = [NSMutableArray array];
        
        self.parsedItems = [[[MMAPI sharedInstance]restoreCacheInformation]mutableCopy];

        
    }

    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"detail" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([[segue identifier] isEqualToString:@"detail"])
    {
       
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        MMGeographicPlace *place = [self.parsedItems objectAtIndex:path.row];
       
        MMDetailViewController *vc = [segue destinationViewController];
       
        vc.place = place;
        
        [[MMAPI sharedInstance]saveCacheInformationWithString:place];
        
    }
}


@end
