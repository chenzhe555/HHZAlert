//
//  HHZToastView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/8.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZToastView.h"
#import <HHZUtils/HHZKitTool.h>
#import <HHZUtils/HHZCalculateTool.h>
#import <HHZConfigs/HHZConfig.h>
#import <HHZCategory/UIView+HHZCategory.h>
#import <HHZBaseClass/HHZLabel.h>

//背景透明度
static CGFloat kMCToastViewAlpha;

//Toast消失的时间
static CGFloat kMCToastViewDuring;

//Toast文字字体大小
static CGFloat kMCToastViewFont;
static CGFloat kMCToastViewLeftSpace;
static CGFloat kMCToastViewTopSpace;

//Toast图片和文字的间隙
static CGFloat KMCToastViewBottomSpace;

//是否带完成的Block回调
static BOOL isHavaBlock;

@interface HHZToastView()
/**
 *  文字上方的图片
 */
@property (nonatomic, strong) UIImageView * titleImage;

/**
 *  文字文本
 */
@property (nonatomic, strong) HHZLabel * titleLabel;

/**
 *  文字的位置类型
 */
@property (nonatomic, assign) HHZToastViewShowType type;

/**
 *  完成的Block回调
 */
@property (nonatomic, copy) toastFinishedBlock toastBlock;

/**
 *  定时器
 */
@property (nonatomic, strong) NSTimer * showTimer;
@end


@implementation HHZToastView

+(instancetype)shareManager
{
    static HHZToastView * custom = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        custom = [[HHZToastView alloc] init];
        UIWindow * window = [HHZKitTool getMainWindow];
        custom.frame = window.bounds;
        [window addSubview:custom];
        custom.hidden = YES;
    });
    return custom;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initFrameParameters];
        
        self.bgView.alpha = kMCToastViewAlpha;
        
       
        
        self.titleLabel = [[HHZLabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:kMCToastViewFont];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        [self.bgView addSubview:_titleLabel];
        
        
        self.titleImage = [[UIImageView alloc] init];
        [self.bgView addSubview:self.titleImage];
        
        
    }
    return self;
}


-(void)initFrameParameters
{
    kMCToastViewAlpha = 0.8f;
    kMCToastViewDuring = 2.0f;
    kMCToastViewFont = 15.0f;
    kMCToastViewLeftSpace = 10.0f;
    kMCToastViewTopSpace = 10.0f;
    KMCToastViewBottomSpace = 60.0f;
}


-(void)showToast:(NSString *)toastString
{
    isHavaBlock = NO;
    _type = HHZToastViewShowTypeBottom;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastType:(HHZToastViewShowType)type text:(NSString *)text time:(CGFloat)time
{
    isHavaBlock = NO;
    _type = type;
    kMCToastViewDuring = time;
    
    [self changeSubViewsFrameAndAnimation:text];
}

-(void)showToast:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    _toastBlock = block;
    _type = HHZToastViewShowTypeBottom;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastInCenter:(NSString *)toastString
{
    isHavaBlock = NO;
    _type = HHZToastViewShowTypeCenter;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastInCenter:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    _toastBlock = block;
    _type = HHZToastViewShowTypeCenter;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString
{
    isHavaBlock = NO;
    _type = HHZToastViewShowTypeImageCenter;
    _titleImage.image = showImage;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    _toastBlock = block;
    _type = HHZToastViewShowTypeImageCenter;
    _titleImage.image = showImage;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)changeSubViewsFrameAndAnimation:(NSString *)toastString
{
    if (toastString == nil)
    {
        toastString = @"";
    }
    
    if ([self.showTimer isValid])
    {
        [self stopToastView];
        [self.showTimer invalidate];
    }
    self.hidden = NO;
    
    _titleLabel.text = toastString;
    _titleLabel.hidden = NO;
    _titleImage.hidden = YES;
    switch (_type) {
        case HHZToastViewShowTypeBottom:
        {
            _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleLabel.width, _titleLabel.height);
            self.frame = CGRectMake((SCREENW - _titleLabel.width - kMCToastViewLeftSpace*2)/2, (SCREENH - KMCToastViewBottomSpace - _titleLabel.height - kMCToastViewTopSpace*2), _titleLabel.width + kMCToastViewLeftSpace*2, _titleLabel.height + kMCToastViewTopSpace*2);
            break;
        }
        case HHZToastViewShowTypeCenter:
        {
            _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleLabel.width, _titleLabel.height);
            self.frame = CGRectMake((SCREENW - _titleLabel.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.height - kMCToastViewTopSpace*2)/2, _titleLabel.width + kMCToastViewLeftSpace*2, _titleLabel.height + kMCToastViewTopSpace*2);
            break;
        }
        case HHZToastViewShowTypeImageCenter:
        {
            _titleImage.hidden = NO;
            if (toastString == nil)
            {
                _titleLabel.hidden = YES;
                _titleImage.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                self.frame = CGRectMake((SCREENW - _titleImage.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleImage.height - kMCToastViewTopSpace*2)/2, _titleImage.width + kMCToastViewLeftSpace*2, _titleImage.height + kMCToastViewTopSpace*2);
            }
            else
            {
                if (_titleLabel.width >= _titleImage.image.size.width)
                {
                    _titleImage.frame = CGRectMake((_titleLabel.width + kMCToastViewLeftSpace*2 - _titleImage.image.size.width)/2, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                    _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, _titleImage.y + _titleImage.height + kMCToastViewTopSpace, _titleLabel.width, _titleLabel.height);
                    self.frame = CGRectMake((SCREENW - _titleLabel.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.y - _titleLabel.height - kMCToastViewTopSpace)/2, _titleLabel.width + kMCToastViewLeftSpace*2,_titleLabel.y + _titleLabel.height + kMCToastViewTopSpace);
                }
                else
                {
                    _titleImage.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                    _titleLabel.frame = CGRectMake((_titleImage.width + kMCToastViewLeftSpace*2 - _titleLabel.width)/2, _titleImage.y + _titleImage.height + kMCToastViewTopSpace, _titleLabel.width, _titleLabel.height);
                    self.frame = CGRectMake((SCREENW - _titleImage.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.y - _titleLabel.height - kMCToastViewTopSpace)/2, _titleImage.width + kMCToastViewLeftSpace*2, _titleLabel.y + _titleLabel.height + kMCToastViewTopSpace);
                    
                }
            }
            break;
        }
        default: {
            break;
        }
    }
    self.bgView.frame = self.bounds;
    
    dispatch_time_t toastDelay = dispatch_time(DISPATCH_TIME_NOW, kMCToastViewDuring * NSEC_PER_SEC);
    dispatch_queue_t currentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(toastDelay, currentQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stopToastView];
        });
    });
    
    [self.showTimer invalidate];
    self.showTimer = nil;
    self.showTimer = [NSTimer scheduledTimerWithTimeInterval:kMCToastViewDuring target:self selector:@selector(stopToastView) userInfo:nil repeats:NO];    
}

-(void)stopToastView
{
    if (isHavaBlock)
    {
        if (_toastBlock)
        {
            _toastBlock();
        }
    }
    self.hidden = YES;
}

@end
