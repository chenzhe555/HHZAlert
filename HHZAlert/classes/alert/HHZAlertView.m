//
//  HHZAlertView.m
//  HHZAlert
//
//  Created by 仁和Mac on 2017/8/14.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZAlertView.h"

@implementation HHZAlertView

+(void)showAlertViewTitle:(NSString *)title message:(NSString *)message delegate:(UIViewController *)delegate buttonTitles:(NSArray<NSString *> *)otherButtonTitles tag:(NSInteger)tag
{
    [self showiOS9beforeAlertTitle:title message:message delegate:delegate buttonTitles:otherButtonTitles tag:tag];
    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0f)
//    {
//        [self showiOS9LaterAlertTitle:title message:message delegate:delegate buttonTitles:otherButtonTitles tag:tag];
//    }
//    else
//    {
//        [self showiOS9beforeAlertTitle:title message:message delegate:delegate buttonTitles:otherButtonTitles tag:tag];
//    }
}

+(void)showiOS9beforeAlertTitle:(NSString *)title message:(NSString *)message delegate:(UIViewController *)delegate buttonTitles:(NSArray<NSString *> *)otherButtonTitles tag:(NSInteger)tag
{
    UIAlertView * alert= nil;
    if (otherButtonTitles.count > 1)
    {
        NSMutableString * btnTitles = [[NSMutableString alloc] init];
        for (int i = 1; i < otherButtonTitles.count; i++)
        {
            if(i == (otherButtonTitles.count - 1))
            {
                [btnTitles appendFormat:@"%@",otherButtonTitles[i]];
            }
            else
            {
                [btnTitles appendFormat:@"%@,",otherButtonTitles[i]];
            }
            
        }
        alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:otherButtonTitles[0] otherButtonTitles:btnTitles, nil];
    }
    else
    {
        alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:otherButtonTitles[0] otherButtonTitles: nil];
    }
    alert.tag = tag;
    [alert show];
}

+(void)showiOS9LaterAlertTitle:(NSString *)title message:(NSString *)message delegate:(UIViewController *)delegate buttonTitles:(NSArray<NSString *> *)otherButtonTitles tag:(NSInteger)tag
{
    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < otherButtonTitles.count; i++)
    {
        UIAlertAction * aAction = [UIAlertAction actionWithTitle:otherButtonTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            if (delegate && [delegate respondsToSelector:@selector(dlHHZAlertView:clickedButtonAtIndex:)])
//            {
//                [delegate dlHHZAlertView:alertC clickedButtonAtIndex:i];
//            }
        }];
        [alertC addAction:aAction];
    }
    
    [((UIViewController *)delegate) presentViewController:alertC animated:YES completion:nil];
}
@end
