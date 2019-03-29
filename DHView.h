//
//  DHView.h
//  Project_Model
//
//  Created by 王奥东 on 2017/12/1.
//

#import <UIKit/UIKit.h>

@interface DHView : UIView

@property (nonatomic, assign) CGFloat adaptor;

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, copy) NSString *iconImageName;

@property (nonatomic, strong) UIImageView *subImageView;
@property (nonatomic, copy) NSString *subImageViewName;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *detailButton;


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detailTitle;
@property (nonatomic, copy) NSString *buttonTitle;

@property (nonatomic, assign) CGSize titleLabelSize;
@property (nonatomic, assign) CGSize detailTitleLabelSize;

@property (nonatomic, assign) CGFloat limiteWidth;

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *detailLabelColor;
@property (nonatomic, strong) UIColor *buttonTitleColor;
@property (nonatomic, strong) UIColor *buttonBackgroundColor;


@property (nonatomic, assign) CGFloat titleFontSize;
@property (nonatomic, assign) CGFloat detailTitleFontSize;
@property (nonatomic, assign) CGFloat buttonTitleFontSize;

//走马灯
@property (nonatomic, assign) BOOL isScrollLamp;//是否为走马灯,YES时则将detailText的值进行走马灯播放
@property (nonatomic, strong) UIScrollView *scrollLamp;//走马灯所需的滚动View，若想自定义，可做修改
@property (nonatomic, strong) UILabel *scrollLabel;//走马灯显示字体的Label，若想自定义，可做修改
@property (nonatomic, strong) NSTimer *scrollTimer;//走马灯滚动需要的定时器，若想自定义，可做修改
@property (nonatomic, strong) UILabel *scrollLabelTwo;//走马灯显示字体的Label，若想自定义，可做修改。这个Label是用于轮圈展示字符的第二个轮播，内容与第一个Label的一致。
@property(nonatomic, assign) CGFloat labelInterval;//两个Label间的空白间隔，若想自定义，可做修改
@property(nonatomic, assign) CGFloat alreadyIndex;//用于已经滚动过的Label个数。最好别修改。



- (void)initUI;
- (void)initAttributes;
- (void)initCustomUI;

@end
