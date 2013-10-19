//
//  CCViewController.m
//  User Data Challenge Solution
//
//  Created by Eliot Arntz on 10/19/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "CCViewController.h"
#import "CCUserData.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* The class method users defined in the CCUserData class returns an NSArray. We set the property users equal to the return value. */
    self.users = [CCUserData users];

    /* Set the delegate and data source property of our TableView equal to self. In short, the Delegate an Datasource classes now know who to send messages to. Since self is a pointer to this ViewController we allow the Delegate and Datasource classes to send information to the ViewController. */
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /* The number of rows in our TableView will be equal to the number of objects in our users Array. */
    return [self.users count];
}

/* Update the cell's textLabel, detailLabel and imageView to the values from our NSDictionaries. Notice the use of the literal syntax to index into the array and key into the dictionary */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *user = self.users[indexPath.row];
    cell.textLabel.text = user[USER_NAME];
    cell.detailTextLabel.text = user[USER_EMAIL];
    cell.imageView.image = user[USER_PROFILE_PICTURE];
    
    return cell;
}

@end
