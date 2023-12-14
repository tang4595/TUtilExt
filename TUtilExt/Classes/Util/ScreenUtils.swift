//
//  ScreenUtils.swift
//  TUtilExt
//
//  Created by tang on 13.10.22.
//

import UIKit

public let kSafeBottom = ((UIScreen.main.bounds.size.height >= 812.0) ? 34.0 : 0.0)
public let kSafeTop = CGFloat((UIScreen.main.bounds.size.height >= 812.0) ? 24.0 : 0.0)
public let kScreenWidth = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height
public let kBottomSpace = ((UIScreen.main.bounds.size.height >= 812.0) ? 34.0 : 16.0)

public let kStatusBarHeight = CGFloat((UIScreen.main.bounds.size.height >= 812.0) ? 44.0 : 20.0)
public let kTopHeight = kStatusBarHeight + 44
public let kPScale = UIScreen.main.bounds.size.width / 375.0
public let kBottomHeight = kSafeBottom + 49

public func K375(_ value:CGFloat) -> CGFloat {
    return value * kPScale
}

public func safeBottomInset(_ value: CGFloat) -> CGFloat {
    return kSafeBottom + value
}
