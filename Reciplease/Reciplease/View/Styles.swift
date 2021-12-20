//
//  Styles.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 19/12/2021.
//
import UIKit
public extension UIFont {
    class func chalkduster(fontSize: CGFloat) -> UIFont {
           return UIFont(name: "chalkduster", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: .heavy)
       }

       class func chalkboard(fontSize: CGFloat) -> UIFont {
           return UIFont(name: "chalkboard SE", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: .semibold)
       }

}

public extension UIColor {

    enum RecipleaseColors {
        case greenReciplease, chalkBoardBackground, whiteReciplease, grayReciplease
            public func rgb() -> (CGFloat, CGFloat, CGFloat) {
                switch self {
                case .chalkBoardBackground: return (34/255,34/255,34/255)
                case .greenReciplease: return (43/255, 95/255, 59/255)
                case .grayReciplease: return (211/255,211/255,211/255)
                case .whiteReciplease: return (255/255, 255/255, 255/255)
                }
            }
    }

    class func recipleasePantone(color: RecipleaseColors, alpha: CGFloat = 1) -> UIColor {
        let (r, g, b) = color.rgb()
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }

}


