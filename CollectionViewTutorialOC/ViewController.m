//
//  ViewController.m
//  CollectionViewTutorialOC
//
//  Created by James Rochabrun on 12/14/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "GridLayout.h"
#import <Foundation/Foundation.h>
#import "ImageCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic) GridLayout *gridLayout;
@property (nonatomic, strong) UICollectionView *gridCollectionView;
@property (nonatomic, strong) UIImageView *fullImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _gridLayout = [GridLayout new];
    _gridCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_gridLayout];
    _gridCollectionView.backgroundColor = [UIColor grayColor];
    _gridCollectionView.showsVerticalScrollIndicator = NO;
    _gridCollectionView.showsHorizontalScrollIndicator = NO;
    _gridCollectionView.dataSource = self;
    _gridCollectionView.delegate = self;
    [_gridCollectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_gridCollectionView];
    
    _fullImageView = [UIImageView new];
    _fullImageView.contentMode = UIViewContentModeScaleAspectFit;
    _fullImageView.backgroundColor = [UIColor darkGrayColor];
    _fullImageView.userInteractionEnabled = YES;
    _fullImageView.alpha = 0;
    [self.view addSubview:_fullImageView];

    UITapGestureRecognizer *dismissWihtTap = [UITapGestureRecognizer new];
    [dismissWihtTap addTarget:self action:@selector(dismissWithTap)];
    [_fullImageView addGestureRecognizer:dismissWihtTap];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect frame = _gridCollectionView.frame;
    frame.size.height = self.view.frame.size.height;
    frame.size.width = self.view.frame.size.width;
    frame.origin.x = 0;
    frame.origin.y = 0;
    _gridCollectionView.frame = frame;
    _fullImageView.frame = _gridCollectionView.frame;
}

- (void)dismissWithTap {
    [UIView animateWithDuration:0.5 animations:^{
        self.fullImageView.alpha = 0;
    }];

}

- (void)showFullImage:(UIImage *)image {
    
    _fullImageView.transform = CGAffineTransformMakeScale(0,0);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.fullImageView.image = image;
        self.fullImageView.alpha = 1;
        self.fullImageView.transform = CGAffineTransformMakeScale(1,1);
    }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:@"puppy"];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = (ImageCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UIImage *image = cell.imageView.image;
    [self showFullImage:image];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
