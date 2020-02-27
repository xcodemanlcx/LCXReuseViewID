//
//  ReuseTableViewVC.m
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "ReuseTableViewVC.h"
#import "UITableView+LCXReuseViewID.h"

@interface ReuseTableViewVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ReuseTableViewVC

- (void)dealloc
{
    NSLog(@"dealloc %@",self.class);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass(self.class);
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 480) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    
    /**
     ## 作用：注册复用view的超级简便使用；
     
     ## 支持：UITableViewCell、UITableViewHeaderFooterView；UICollectionViewCell、UICollectionReusableView；
     
     ## 思路：
     1 以复用View的类名作为复用id；
     2 通过runtime给分类添加属性；

     ## 优点：以UITableViewCell子类的注册复用为例：
     1 免import使用cell的头文件；
     2 免命名reuseID；
     3 免重复register复用cell类（特别cell种类多时，代码简化作用明显）；
     4 防止reuseID在register时和在tableview delegate中使用时，不一致错误；
     5 打印提示：未注册成功的类名字符串；
     */
    _tableView.lcx_registerCellClassNames = @[@"ATableViewCell",@"BTableViewCell"];
    _tableView.lcx_registerHeaderFooterClassNames = @[@"AHeaderFooterView",@"BHeaderFooterView"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_tableView.lcx_registerCellClassNames[indexPath.row%2]];
    return cell;
}

#pragma mark - UITableviewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:_tableView.lcx_registerHeaderFooterClassNames[section%2]];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
