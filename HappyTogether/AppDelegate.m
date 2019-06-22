//
//  AppDelegate.m
//  Shop
//
//  Created by 朱啸 on 2018/4/11.
//  Copyright © 2018年 朱啸. All rights reserved.
//

#import "AppDelegate.h"
//#import "GGXXYYHomeVC.h"
//import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
#import "UMessage.h"
//#import "ViewController.h"
#import <WXApi.h>
//#import <AlipaySDK/AlipaySDK.h>
#import <UserNotifications/UserNotifications.h>
#import "LxmHomeVC.h"
//推送
#define UMKey @"5ce3d9d50cafb213130006e0"
//友盟安全密钥//quvss8rcpv3jahqyajgeuspa6o1vdeqr
#define SinaAppKey @"102135063"
#define SinaAppSecret @"47a31952aed883dc13cdccaf9b30df0d"
#define QQAppID @"101504727"
#define QQAppKey @"2e7928e5d1e2974eb06a35fa408e0950"
#define WXAppID @"wxe68b61e47e500548"
#define WXAppSecret @"96405f2eddb5e6cd8e6e01c87bbda8fb"

//#define UMKey @"5ba076ecf1f5563fef000179"
//#define WXAppID @"wxcb65aa46d04ad49b"
//#define WXAppSecret @"e44bf1d172e7b6a4638e8ecc63bb80e1"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseNavigationController *nav=[[BaseNavigationController alloc] initWithRootViewController:[[LxmHomeVC alloc] init]];
    self.window.rootViewController=nav;

//    GGXXYYHomeVC * vc = [[GGXXYYHomeVC alloc] init];
//    self.window.rootViewController = vc;
    
    
    
    [self.window makeKeyAndVisible];
    
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMKey];
    
    [self configUSharePlatforms];
//    [self initUment:launchOptions];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString *userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSString *newUserAgent = [userAgent stringByAppendingString:@"/kyhios/CK 2.0"];//自定义需要拼接的字符串
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:newUserAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
    
    [self.window makeKeyAndVisible];
    
    //
//    BOOL isQieHuan = ![self checkProductDate:@"2019-06-19"];
//
//    if (isQieHuan){
//          [self updateApp];
//    }
    return YES;
}

- (BOOL)checkProductDate: (NSString *)tempDate {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [dateFormatter dateFromString:tempDate];

    if ([date earlierDate:[NSDate date]] != date) {
        
        return true;
    } else {
        
        return false;
    }
    
}

- (void)configUSharePlatforms
{
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WXAppID appSecret:WXAppSecret redirectURL:@"http://mobile.umeng.com/social"];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAppID/*设置QQ平台的appID*/  appSecret:QQAppKey redirectURL:@"http://mobile.umeng.com/social"];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:SinaAppKey  appSecret:SinaAppSecret redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}

//- (void)updateApp {
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",@"1468639448"]];
//
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
//    [request setHTTPMethod:@"POST"];
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request
//                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//                                         if (data)
//                                         {
//                                             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//
//                                             if (dic)
//                                             {
//                                                 NSArray * arr = [dic objectForKey:@"results"];
//                                                 if (arr.count>0)
//                                                 {
//                                                     NSDictionary * versionDict = arr.firstObject;
//
//                                                     //服务器版本
//                                                     NSString * version = [[versionDict objectForKey:@"version"] stringByReplacingOccurrencesOfString:@"." withString:@""];
//                                                     //当前版本
//                                                     NSString * currentVersion = [[[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"] stringByReplacingOccurrencesOfString:@"." withString:@""];
//
//
//
//                                                     dispatch_async(dispatch_get_main_queue(), ^{
//
//                                                         if ([version integerValue] < [currentVersion integerValue]) {
//                                                             BaseNavigationController *nav=[[BaseNavigationController alloc] initWithRootViewController:[[LxmHomeVC alloc] init]];
//                                                             self.window.rootViewController=nav;
//                                                             [self.window makeKeyAndVisible];
//                                                         }else {
//                                                             GGXXYYHomeVC * vc = [[GGXXYYHomeVC alloc] init];
//                                                             self.window.rootViewController = vc;
//                                                             [self.window makeKeyAndVisible];
//                                                         }
//
//
//                                                     });
//
//                                                 }
//                                             }
//                                         }
//                                     }] resume];
//
//
//}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
