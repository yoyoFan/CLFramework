//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIDevice+CLDevice.h
//  CLFoundation
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CLDevice)

/**
 *  获取系统版本号
 *
 *  @return 返回系统版本号
 */
+ (NSString *)cl_getSystemVersion;

/**
 *  获取设备名称
 *
 *  @return 返回真机或模拟器设备名称
 */
+ (NSString *)cl_getDeviceName;

/**
 *  获取设备类型
 *
 *  @return 返回iPhone, iPod Touch, iPad其中之一的设备类型
 */
+ (NSString *)cl_getDeviceModelType;

/**
 获取设备的唯一标识符

 @return 获取设备的唯一标识符, 格式是:"E621E1F8-C36C-495A-93FC-0C247A3E6E5F"
 */
+ (NSString *)cl_getUUIDString;

/**
 获取当前网络运营商的名称

 @return 中国移动/中国联通/中国电信或者其他运营商
 */
+ (NSString *)cl_getCarrierName;

/**
 获取当前网络的类型

 @return 2G/3G/4G/WiFi或者未来的一些网络类型
 CTRadioAccessTechnologyGPRS            //介于2G和3G之间，也叫2.5G ,过度技术
 CTRadioAccessTechnologyEdge            //EDGE为GPRS到第三代移动通信的过渡，EDGE俗称2.75G
 CTRadioAccessTechnologyWCDMA           //
 CTRadioAccessTechnologyHSDPA           //亦称为3.5G(3?G)
 CTRadioAccessTechnologyHSUPA           //3G到4G的过度技术
 CTRadioAccessTechnologyCDMA1x          //3G
 CTRadioAccessTechnologyCDMAEVDORev0    //3G标准
 CTRadioAccessTechnologyCDMAEVDORevA
 CTRadioAccessTechnologyCDMAEVDORevB
 CTRadioAccessTechnologyeHRPD           //电信使用的一种3G到4G的演进技术， 3.75G
 CTRadioAccessTechnologyLTE             //接近4G
 */
+ (NSString *)cl_getCurrentRadioAccessTechnology;

@end
