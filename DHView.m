//
//  DHView.m
//  Project_Model
//
//  Created by 王奥东 on 2017/12/1.
//

#import "DHView.h"

@implementation DHView

- (CGFloat)adaptor {
    
    return SCREEN_WIDTH / 750;
}

- (UIImageView *)icon {
    
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [self addSubview:_icon];
    }
    return _icon;
}

- (void)setIconImageName:(NSString *)iconImageName {
    
    _iconImageName = iconImageName;
    self.icon.image = [UIImage imageNamed:_iconImageName];
}


- (UIImageView *)subImageView {
    
    if (!_subImageView) {
        _subImageView = [[UIImageView alloc] init];
        [self addSubview:_subImageView];
    }
    return _subImageView;
}

- (void)setSubImageViewName:(NSString *)subImageViewName {
    
    _subImageViewName = subImageViewName;
    self.icon.image = [UIImage imageNamed:_iconImageName];
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UIButton *)button {
    
    if (!_button) {
        _button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:_button];
    }
    return _button;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self initUI];
        [self initAttributes];
        [self initCustomUI];

    }
    return self;
}

- (void)initUI {
    
    
}

- (void)setTitle:(NSString *)title {

    _title = title;
    self.titleLabel.text = _title;
    CGSize sizeToFit = [self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    if (CGSizeEqualToSize(sizeToFit, CGSizeZero)) {
        sizeToFit = CGSizeMake(20, 20);
    }
    self.titleLabelSize = sizeToFit;
}

- (void)setDetailTitle:(NSString *)detailTitle {
    
    _detailTitle = detailTitle;
    self.detailLabel.text = _detailTitle;
    CGSize sizeToFit = [self.detailLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    if (CGSizeEqualToSize(sizeToFit, CGSizeZero)) {
        sizeToFit = CGSizeMake(20, 20);
    }
    self.detailTitleLabelSize = sizeToFit;
    
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    
    [self.button setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)setTitleFontSize:(CGFloat)titleFontSize {
    
    _titleFontSize = titleFontSize;
    self.titleLabel.font = [UIFont systemFontOfSize:_titleFontSize];
}

- (void)setDetailTitleFontSize:(CGFloat)detailTitleFontSize {
 
    _detailTitleFontSize = detailTitleFontSize;
    self.detailLabel.font = [UIFont systemFontOfSize:_detailTitleFontSize];
}

- (void)setButtonTitleFontSize:(CGFloat)buttonTitleFontSize {
    
    _buttonTitleFontSize = buttonTitleFontSize;
    self.button.titleLabel.font = [UIFont systemFontOfSize:buttonTitleFontSize];
}

- (CGSize)titleLabelSize {
    
    if (CGSizeEqualToSize(_titleLabelSize, CGSizeZero) ) {
        _titleLabelSize =  CGSizeMake(20, 20);
    }
    return _titleLabelSize;
}

- (CGSize)detailTitleLabelSize {
    
    if (CGSizeEqualToSize(_detailTitleLabelSize, CGSizeZero) ) {
        _detailTitleLabelSize =  CGSizeMake(20, 20);
    }
    return _detailTitleLabelSize;
}

- (void)initAttributes {
    
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor {
    
    _buttonTitleColor = buttonTitleColor;
    [self.button setTitleColor:_buttonTitleColor forState:UIControlStateNormal];
}

- (void)setButtonBackgroundColor:(UIColor *)buttonBackgroundColor {
    
    _buttonBackgroundColor = buttonBackgroundColor;
    [self.button setBackgroundColor:_buttonBackgroundColor];
}

- (void)initCustomUI {
    
    
}

- (UIButton *)detailButton {
    
    if (!_detailButton) {
        _detailButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:_detailButton];
    }
    return _detailButton;
}

-(void)setIsScrollLamp:(BOOL)isScrollLamp {
    
    _isScrollLamp = isScrollLamp;
    if (_isScrollLamp) {

        if (!_scrollLamp) {
            _scrollLamp = [[UIScrollView alloc] init];
            [self addSubview:_scrollLamp];
        }else {
            [_scrollLamp setContentOffset:CGPointMake(0, 0)];
        }
        [_scrollTimer invalidate];
        _scrollTimer = nil;//防止重用
        
        [_scrollLamp mas_makeConstraints:^(MASConstraintMaker *make) {
            
                make.left.right.mas_equalTo(_detailLabel);
            make.top.mas_equalTo(_detailLabel).mas_offset(DHAdaptive(-1));
            make.bottom.mas_equalTo(_detailLabel).mas_offset(DHAdaptive(1));
        }];
        
        if (!_scrollLabel) {
            _scrollLabel = [[UILabel alloc] init];
        }
        _scrollLabel.textAlignment = _detailLabel.textAlignment;
        _scrollLabel.text = _detailLabel.text;
        _scrollLabel.textColor = _detailLabel.textColor;
        //sizeToFit & setAdjustsFontSizeToFitWidth 或 直接使用detailLabel的font都有字体过大导致展示不完整的效果
        _scrollLabel.font = _detailLabel.font;
        
        [_scrollLamp addSubview:_scrollLabel];
        
        _detailLabel.hidden = YES;
        
        _labelInterval = DHAdaptive(160);
        
        if (!_scrollLabelTwo) {
            _scrollLabelTwo = [[UILabel alloc] init];
        }
        _scrollLabelTwo.textAlignment = _detailLabel.textAlignment;
        _scrollLabelTwo.text = _detailLabel.text;
        _scrollLabelTwo.textColor = _detailLabel.textColor;
        
        //sizeToFit & setAdjustsFontSizeToFitWidth 或 直接使用detailLabel的font都有字体过大导致展示不完整的效果
        _scrollLabelTwo.font = _detailLabel.font;
        
        [_scrollLamp addSubview:_scrollLabelTwo];
        
        //第一个Label
        [_scrollLabel mas_makeConstraints:^(MASConstraintMaker *make) {

                make.bottom.left.top.mas_equalTo(_scrollLamp);
           
            make.width.mas_greaterThanOrEqualTo(_scrollLamp.frame.size.width);
        }];
        
        
        //第二个Label
        [_scrollLabelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            
                make.top.bottom.mas_equalTo(_scrollLabel);
            make.left.mas_equalTo(_scrollLabel.mas_right).mas_offset(_labelInterval);
            
                make.width.mas_greaterThanOrEqualTo(_scrollLabel);
        }];
        
        
        [_scrollLamp setNeedsLayout];
        [_scrollLamp layoutIfNeeded];//不更新的话，宽度就为0了
        
        [_scrollLabel setNeedsLayout];
        [_scrollLabel layoutIfNeeded];
        
        [_scrollLabelTwo setNeedsLayout];
        [_scrollLabelTwo layoutIfNeeded];
        
        _alreadyIndex = 0;//还没开始滚动，所以滚动过0个Label
        
        _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(scrollDetailText) userInfo:nil repeats:YES] ;
        [[NSRunLoop mainRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
        
        
    }else {//非走马灯时，就直接放在自己身上
        
        [_scrollTimer invalidate];
        _scrollTimer = nil;//不这样设置，会内存泄露的。
        
        _detailLabel.text = _scrollLabel.text;
        _detailLabel.hidden = NO;
        
        [_scrollLamp removeFromSuperview];
        _scrollLamp = nil;
        
        [_scrollLabel removeFromSuperview];
        _scrollLabel = nil;
    }
    
}

-(void)scrollDetailText {//开始滚动
    
    //width 莫名总是被改为0
    _scrollLamp.contentSize = CGSizeMake(MAXFLOAT, 0);
    
    if(_scrollLamp.contentOffset.x > _scrollLabel.frame.origin.x + _scrollLabel.frame.size.width) {//scrollLabel滚动消失了
        
        CGFloat x = CGRectGetMaxX(_scrollLabel.frame) + _labelInterval;
        
        [_scrollLabelTwo mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(x);
            make.top.bottom.mas_equalTo(_scrollLamp);
            make.width.mas_greaterThanOrEqualTo(_scrollLamp.frame.size.width);
        }];
        [_scrollLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_scrollLabelTwo.mas_right).mas_offset(_labelInterval);
            
            make.top.bottom.mas_equalTo(_scrollLamp);
            make.width.mas_greaterThanOrEqualTo(_scrollLamp.frame.size.width);
        }];
    }else if (_scrollLamp.contentOffset.x > _scrollLabelTwo.frame.origin.x + _scrollLabelTwo.frame.size.width) {
        
        CGFloat x = CGRectGetMaxX(_scrollLabelTwo.frame) + _labelInterval;
        
        [_scrollLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(x);
            
            make.top.bottom.mas_equalTo(_scrollLamp);
            make.width.mas_greaterThanOrEqualTo(_scrollLamp.frame.size.width);
        }];
        
        [_scrollLabelTwo mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_scrollLabel.mas_right).mas_offset(_labelInterval);
            
            make.top.bottom.mas_equalTo(_scrollLamp);
            make.width.mas_greaterThanOrEqualTo(_scrollLamp.frame.size.width);
        }];
    }
    
  
    
    [_scrollLamp setContentOffset:CGPointMake(_scrollLamp.contentOffset.x + DHAdaptive(12), 0) animated:YES];
    
//    //只有超出当前控件的才会被滚动，滚动到最终端过2.4秒会反弹
//    if (_scrollLamp.contentOffset.x + 2 <= (_scrollLamp.contentSize.width - _scrollLamp.frame.size.width)+DHAdaptive(32)) {
//
//        [_scrollLamp setContentOffset:CGPointMake(_scrollLamp.contentOffset.x + 2, 0) animated:YES];
//
//    }else {//滚到头了
//
//        [_scrollLamp setContentOffset:CGPointMake(0, 0) animated:YES];
//
//    }
    
}



@end
