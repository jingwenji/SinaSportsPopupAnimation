//
//  ViewController.m
//  SinaSportsPopupAnimation
//
//  Created by HDF on 16/9/20.
//  Copyright © 2016年 HDF. All rights reserved.
//

#import "ViewController.h"
#import "HDFCollectionViewCell.h"


#define ReuseIdentifier @"medal"
#define headerId @"headerId"
#define footerId @"footerId"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *popView;
@property (nonatomic, assign) CGFloat contentOffsetY;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIImageView *popImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UIButton *certainBtn;
@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"SinaSports PopupAnimation";
    
    [self initImageArray];
    [self initUI];
    [self initPopView];
}


- (void)initImageArray
{
    self.imageArray = [NSMutableArray array];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 1; i < 13; i++) {
        [arr addObject:[NSString stringWithFormat:@"christmas_%d.png",i]];
    }
    
    for (int i = 0; i < 5; i++) {
        [self.imageArray addObjectsFromArray:arr];
    }
}
- (void)initUI
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(CountWidth(180), CountHeight(230));
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = CountHeight(24);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[HDFCollectionViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];

}


- (void)initPopView{
    self.popView = [[UIView alloc] init];
    self.popView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.popView.backgroundColor = [UIColor whiteColor];
    self.popView.hidden = YES;
    [self.navigationController.view addSubview:self.popView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popViewBack)];
    [self.popView addGestureRecognizer:tap];
    
    
    
    self.backView = [[UIView alloc] init];
    self.backView.frame = CGRectMake(CountWidth(30), CountHeight(54), CountWidth(60), CountWidth(60));
//    self.backView.backgroundColor = NormalGreenColor;
    self.backView.layer.cornerRadius = self.backView.frame.size.width/2;
    self.backView.layer.borderColor = NormalGreenColor.CGColor;
    self.backView.layer.borderWidth = 1;
    [self.popView addSubview:self.backView];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:(CGPointMake(CountWidth(15), CountWidth(15)))];
    [path addLineToPoint:(CGPointMake(CountWidth(45), CountWidth(45)))];
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    shaperLayer.path = path.CGPath;
    shaperLayer.strokeColor = NormalGreenColor.CGColor;
    [self.backView.layer addSublayer:shaperLayer];
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:(CGPointMake(CountWidth(45), CountWidth(15)))];
    [path1 addLineToPoint:(CGPointMake(CountWidth(15), CountWidth(45)))];
    CAShapeLayer *shaperLayer1 = [CAShapeLayer layer];
    shaperLayer1.path = path1.CGPath;
    shaperLayer1.strokeColor = NormalGreenColor.CGColor;
    [self.backView.layer addSublayer:shaperLayer1];
    
    
    
    self.popImageView = [[UIImageView alloc] init];
    [self.popView addSubview:self.popImageView];
    
    
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.frame = CGRectMake(0, CountHeight(518), SCREEN_WIDTH, CountHeight(33));
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.hidden = YES;
    self.nameLabel.textColor = LCRGBAColor(114, 113, 113, 1);
    self.nameLabel.font = [UIFont systemFontOfSize:17.0];
    [self.popView addSubview:self.nameLabel];
    

    
    
    self.levelLabel = [[UILabel alloc] init];
    self.levelLabel.frame = CGRectMake(0, self.nameLabel.frame.origin.y+self.nameLabel.frame.size.height+CountHeight(100), SCREEN_WIDTH, CountHeight(26));
    self.levelLabel.textAlignment = NSTextAlignmentCenter;
    self.levelLabel.hidden = YES;
        self.levelLabel.text = [NSString stringWithFormat:@"anything whatever you want to say"];
    self.levelLabel.textColor = LCRGBAColor(88, 88, 88, 1);
    self.levelLabel.font = [UIFont italicSystemFontOfSize:13.0];
    [self.popView addSubview:self.levelLabel];
    
    
    
    
    self.certainBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.certainBtn.frame = CGRectMake(CountWidth(175), self.levelLabel.frame.origin.y+self.levelLabel.frame.size.height+CountHeight(150), CountWidth(400), CountHeight(80));
    self.certainBtn.backgroundColor = NormalGreenColor;
    self.certainBtn.layer.cornerRadius = CountHeight(80)/2;
    self.certainBtn.hidden = YES;
    [self.certainBtn setTitle:@"share" forState:(UIControlStateNormal)];
    [self.certainBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.certainBtn.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    [self.certainBtn addTarget:self action:@selector(startTask) forControlEvents:(UIControlEventTouchUpInside)];
    [self.popView addSubview:self.certainBtn];
}

- (void)popViewBack
{
    HDFCollectionViewCell *cell = (HDFCollectionViewCell *)[_collectionView cellForItemAtIndexPath:self.indexPath];
    cell.medalImageView.hidden = YES;
    self.popView.backgroundColor = [UIColor clearColor];
    self.nameLabel.hidden = YES;
    self.levelLabel.hidden = YES;
    self.certainBtn.hidden = YES;
    self.backView.hidden = YES;
    
    
    [UIView animateWithDuration:0.4 animations:^{
        self.popImageView.frame =CGRectMake(cell.frame.origin.x, cell.frame.origin.y-self.contentOffsetY,  cell.medalImageView.frame.size.width, cell.medalImageView.frame.size.width);
    } completion:^(BOOL finished) {
        cell.medalImageView.hidden = NO;
        self.popView.hidden = YES;
        self.popView.backgroundColor = [UIColor whiteColor];
    }];
    
}
- (void)startTask
{
   [self showAlertControllerWithMessage:@"Code is so easy,but please give me a 👍,QQ:188816190" block:^{
        
   }];
}



#pragma mark  --------   UICollectionView delegate and datasource   --------
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.imageArray.count;
}

//自定义cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HDFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    UIImage *theImage =  [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.medalImageView.image = theImage;
    cell.medalNameLabel.text = [NSString stringWithFormat:@"- %ld -",indexPath.row];
    return cell;
}




- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HDFCollectionViewCell *cell = (HDFCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    
    cell.medalImageView.hidden = YES;
    self.indexPath = indexPath;
    
    
    self.popImageView.frame =CGRectMake(cell.frame.origin.x, cell.frame.origin.y-self.contentOffsetY,  cell.medalImageView.frame.size.width, cell.medalImageView.frame.size.width);
    self.popImageView.image = cell.medalImageView.image;
    self.nameLabel.text = cell.medalNameLabel.text;
    

    
    [UIView animateWithDuration:0.4 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.popImageView.center = CGPointMake(SCREEN_WIDTH/2, CountHeight(368));
        self.popImageView.bounds = CGRectMake(0, 0, CountWidth(240), CountWidth(240));
        self.popView.hidden = NO;
    } completion:^(BOOL finished) {
        cell.medalImageView.hidden = NO;
        self.nameLabel.hidden = NO;
        self.levelLabel.hidden = NO;
        self.certainBtn.hidden = NO;
        self.backView.hidden = NO;
    }];
    
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.contentOffsetY = _collectionView.contentOffset.y;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId forIndexPath:indexPath];
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter){
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId forIndexPath:indexPath];
        reusableview = footerview;
    }
    reusableview.backgroundColor = [UIColor whiteColor];
    return reusableview;
}

#pragma mark  --------   flowLayoutDelegate   --------

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, CountHeight(20));
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, CountHeight(20));
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(CountHeight(20), CountWidth(30), 0, CountWidth(30));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
