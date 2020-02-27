//
//  ReuseCollectionViewVC.m
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "ReuseCollectionViewVC.h"
#import "UICollectionView+LCXReuseViewID.h"

#define UIScreen_Width [UIScreen mainScreen].bounds.size.width

@interface ReuseCollectionViewVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ReuseCollectionViewVC

- (void)dealloc
{
    NSLog(@"dealloc %@",self.class);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass(self.class);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 横向items的间距
    flowLayout.minimumLineSpacing = 5;
    // 纵向items的间距
    flowLayout.minimumInteritemSpacing = 5;
    // 所有item的size
    flowLayout.itemSize = CGSizeMake((UIScreen_Width-10*2-5)/2, 40);
    // 定义每个UICollectionView分区外边距（上左下右）
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, UIScreen_Width, 480) collectionViewLayout:flowLayout];
    //self.view.bounds.size.width
    [self.view addSubview:collectionView];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor orangeColor];
    collectionView.lcx_registerCellClassNames = @[@"ACollectionViewCell",@"BCollectionViewCell"];
    collectionView.lcx_registerHeaderClassNames = @[@"ACollectionHeaderView",@"BCollectionHeaderView"];
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 20;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionView.lcx_registerCellClassNames[indexPath.row%2] forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
            UICollectionReusableView *reuseView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionView.lcx_registerHeaderClassNames[indexPath.section%2] forIndexPath:indexPath];
        return reuseView;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(UIScreen_Width/2, 30);
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
