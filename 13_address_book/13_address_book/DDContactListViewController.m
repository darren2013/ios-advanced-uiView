//
//  DDContactListViewController.m
//  13_address_book
//
//  Created by 杜东方 on 15/11/30.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDContactListViewController.h"
#import "DDContactAddViewController.h"
#import "DDContact.h"
#import "DDContactEditViewController.h"
#import "DDContactTableViewCell.h"

#define DDCONTACTSFILE [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"contacts2.arc"]

@interface DDContactListViewController ()<UIActionSheetDelegate,DDContactAddViewControllerDelegate,DDContactEditViewControllerDelegate>
- (IBAction)logout:(UIBarButtonItem *)sender;

- (IBAction)editBarBtnItemClicked:(UIBarButtonItem *)sender;


@property(nonatomic,strong)NSMutableArray *contactArray;

@end

@implementation DDContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSMutableArray *)contactArray{
    if (!_contactArray) {
//        _contactArray = [NSMutableArray array];
//        DDContact *contact = [[DDContact alloc] init];
//        contact.name = @"zhangsan";
//        contact.phone = @"232233";
//        [_contactArray addObject:contact];
        
        _contactArray = [NSKeyedUnarchiver unarchiveObjectWithFile:DDCONTACTSFILE];
        
        if (!_contactArray) {
            _contactArray = [NSMutableArray array];
        }
    }
    
    return _contactArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contactArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //static NSString *reuseId = @"contacts";
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseId];
//    }
    
    DDContactTableViewCell *cell = [DDContactTableViewCell cellWithTableView:self.tableView];
    
    DDContact *contact = self.contactArray[indexPath.row];
    cell.contact = contact;
    
    //cell.textLabel.text = contact.name;
    //cell.detailTextLabel.text = contact.phone;
    
    
    return cell;
}



//往左移动cell,可以出现删除按钮
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [self.contactArray removeObjectAtIndex:indexPath.row];
        
        //reloadData会把整个tableViewDataSource重新执行一遍，性能较差
        //[self.tableView reloadData];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [NSKeyedArchiver archiveRootObject:self.contactArray toFile:DDCONTACTSFILE];
    }else if(UITableViewCellEditingStyleInsert == editingStyle){
        DDContact *contact = [[DDContact alloc] init];
        contact.name = @"李四";
        contact.phone = @"345223";
        
        [self.contactArray insertObject:contact atIndex:indexPath.row + 1];
        
        //[self.tableView reloadData];
        NSIndexPath *toIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[toIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [NSKeyedArchiver archiveRootObject:self.contactArray toFile:DDCONTACTSFILE];
    }
    
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row % 2 == 0) {
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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

- (IBAction)logout:(UIBarButtonItem *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"确定要注销吗?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

/*
 由于存在编辑模式，会把整个contentView之外添加删除或插入按钮
 所以，在自定义的cell添加控件时必须加在contentView上
 */
//tableView处于编辑模式时，才可以显示添加按钮
- (IBAction)editBarBtnItemClicked:(UIBarButtonItem *)sender {
    //self.tableView.editing = !self.tableView.editing;
    
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    UIViewController *vc = segue.destinationViewController;
    
    if ([vc isKindOfClass:[DDContactAddViewController class]]) {
        DDContactAddViewController *contactAddViewController = (DDContactAddViewController *)vc;
        contactAddViewController.delegate = self;
    }else if ([vc isKindOfClass:[DDContactEditViewController class]]){
        DDContactEditViewController *editViewController = (DDContactEditViewController *)vc;
        editViewController.delegate = self;
        editViewController.contact = self.contactArray[self.tableView.indexPathForSelectedRow.row];
        
    }
    
    
}

#pragma mark UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != 0) return;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark DDContactAddViewControllerDelegate

-(void)addContactWithEditViewController:(DDContactAddViewController *)contactViewController withContact:(DDContact *)contact{
    [self.contactArray addObject:contact];
    NSLog(@"%p",self.contactArray);
    [NSKeyedArchiver archiveRootObject:self.contactArray toFile:DDCONTACTSFILE];
    
    [self.tableView reloadData];
}

#pragma mark DDContactEditViewControllerDelegate

-(void)contactEditViewController:(DDContactEditViewController *)contactEditViewController withContact:(DDContact *)contact{
    //因为是同一个引用，可以不这样显示赋值
//    DDContact *selectedContact = self.contactArray[self.tableView.indexPathForSelectedRow.row];
//    selectedContact.name = contact.name;
//    selectedContact.phone = contact.phone;
    
    [self.tableView reloadData];
}

@end
