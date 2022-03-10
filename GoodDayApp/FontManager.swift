//
//  FontManager.swift
//  GoodDayApp
//
//  Created by myungsun on 2022/03/08.
//

import Foundation
import UIKit

class FontManager {
    static let shared = FontManager()
    
    private init() {}
    
    func getNanumSquareL(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "NanumSquareOTFL", size: fontSize)!
    }
    
    func getNanumSquareR(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "NanumSquareOTFR", size: fontSize)!
    }
    
    func getNanumSquareB(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "NanumSquareOTFB", size: fontSize)!
    }
    
    func getNanumSquareEB(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "NanumSquareOTFEB", size: fontSize)!
    }
}
