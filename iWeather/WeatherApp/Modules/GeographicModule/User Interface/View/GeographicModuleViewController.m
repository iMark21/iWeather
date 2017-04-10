//
//  GeographicModuleViewController.m
//  WeatherApp
//
//  Created by Juan Miguel Marqués Morilla on 04/01/2017.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "GeographicModuleViewController.h"
#import "GeographicModuleWireFrame.h"
#import "SVProgressHUD.h"

@interface GeographicModuleViewController ()
@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation GeographicModuleViewController

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showGeographicList];
}

- (void)showGeographicList{
    [SVProgressHUD show];
    [self.presenter viewDidLoad];
}

- (void)setGeographicListDataSource:(NSArray *)geographicPlaces error:(BOOL)error{
    self.dataSource = [NSArray arrayWithArray:geographicPlaces];
    [self.tableView reloadData];
    [SVProgressHUD dismiss];
}
#pragma mark - TableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Geoname *place = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text =  place.name;
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    [self.searchBar resignFirstResponder];
    Geoname *place = [self.dataSource objectAtIndex:indexPath.row];
    if (place!=nil) {
        [self.presenter storeGeonameItem:place];
        [self.presenter didSelected:place];
    }
}

#pragma mark - SearchBarDelegate methods

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [SVProgressHUD show];
    [self.presenter reloadViewWithQuery:searchText];
}

@end
