//
//  UIDevice.swift
//  ankityddv
//
//  Created by Ankit Yadav on 08/06/23.
//

import UIKit

/**
 These extensions have the intention to return if the current device has certain size or not.
 */
public extension UIDevice {

    func maxScreenLength() -> CGFloat {
        let bounds = UIScreen.main.bounds
        return max(bounds.width, bounds.height)
    }

    func iPhone4() -> Bool {
        return maxScreenLength() == 480
    }

    func iPhone5() -> Bool {
        return maxScreenLength() == 568
    }

    func iPhone6or7() -> Bool {
        return maxScreenLength() == 667
    }

    func iPhone6or7Plus() -> Bool {
        return maxScreenLength() == 736
    }

    func iPhoneX() -> Bool {
        return maxScreenLength() == 812
    }

    func iPhoneXRorXSMax() -> Bool {
        return maxScreenLength() == 896
    }

    func iPhone14or14Pro() -> Bool {
        return maxScreenLength() == 844
    }

    func iPhone14ProMax() -> Bool {
        return maxScreenLength() == 926
    }
    
    func isSmallDevice() -> Bool {
        iPhone4() || iPhone5() || iPhone6or7() || iPhone6or7Plus()
    }

    /**
     Resize a font according to current device. Works for iPhone apps only. The desired font size will be multiplied by the coefficient for the corresponding current device.
     All coefficients have reasonable default values.

     - parameter size: Desired font size for iPhone6 Plus device type (or any other with the same size)
     - parameter q6:   iPhone6 coefficient
     - parameter q5:   iPhone5 coefficient
     - parameter q4:   iPhone4 coefficient

     - returns: The correctly resized font size
     */
    func fontSizeForDevice(_ size: CGFloat, q6: CGFloat = 0.94, q5: CGFloat = 0.86, q4: CGFloat = 0.80) -> CGFloat {
      
        if iPhone4() {
            return max(10, size * q4)
        } else if iPhone5() {
            return max(10, size * q5)
        } else if iPhone6or7() {
            return max(10, size * q6)
        }
        return size
    }
}

/**
 Scale a value for a vertical constraint constant depending on the current device. Works for iPhone apps only. All coefficients have reasonable default values for vertical constraints

 - parameter value: Desired value for iPhone XS Max, iPhone XR, iPhone 11, iPhone 11 Pro Max device type (or any other with the same size)
 - parameter q12Plus:   iPhone 12 Pro Max coefficient
 - parameter q12:   iPhone 12  and iPhone 12  Pro coefficient
 - parameter qx:   iPhone X, iPhone Xs, iPhone 11 Pro and iPhone 12 Mini coefficient
 - parameter qPlus:   iPhone6 Plus and iPhone7 Plus coefficient
 - parameter q6:   iPhone6 and iPhone7 coefficient
 - parameter q5:   iPhone5 coefficient
 - parameter q4:   iPhone4 coefficient
 
 - returns: The correctly resized constraint value
 */
public func suggestedVerticalConstraint(_ value: CGFloat, q12ProMax: CGFloat = 1.033, q12: CGFloat = 0.94, qx: CGFloat = 0.906, qPlus: CGFloat = 0.83, q6: CGFloat = 0.75, q5: CGFloat = 0.64, q4: CGFloat = 0.54) -> CGFloat {
    
    if UIDevice.current.iPhone4() {
        return ceil(value * q4)
    } else if UIDevice.current.iPhone5() {
        return ceil(value * q5)
    } else if UIDevice.current.iPhone6or7() {
        return ceil(value * q6)
    } else if UIDevice.current.iPhone6or7Plus() {
        return value * qPlus
    } else if UIDevice.current.iPhoneX() {
        return value * qx
    } else if UIDevice.current.iPhone14or14Pro() {
        return value * q12
    } else if UIDevice.current.iPhone14ProMax() {
        return value * q12ProMax
    } else {
        return value
    }
}

/**
 Scale a value for a horizontal constraint constant depending on the current device. Works for iPhone apps only. All coefficients have reasonable default values for horizontal constraints

 - parameter value: Desired value for iPhone XS Max, iPhone XR, iPhone 11, iPhone 11 Pro Max device type (or any other with the same size)
 - parameter q12Plus:   iPhone 12 Pro Max coefficient
 - parameter q12:   iPhone 12  and iPhone 12  Pro coefficient
 - parameter qx:   iPhone X, iPhone Xs, iPhone 11 Pro and iPhone 12 Mini coefficient
 - parameter qPlus:   iPhone6 Plus and iPhone7 Plus coefficient
 - parameter q6:   iPhone6 and iPhone7 coefficient
 - parameter q5:   iPhone5 coefficient
 - parameter q4:   iPhone4 coefficient

 - returns: The correctly resized constraint value
 */
public func suggestedHorizontalConstraint(_ value: CGFloat, q12ProMax: CGFloat = 1.034, q12: CGFloat = 0.94, qx: CGFloat = 0.9, qPlus: CGFloat = 1, q6: CGFloat = 0.9, q5: CGFloat = 0.77, q4: CGFloat = 0.77) -> CGFloat {
  
    if UIDevice.current.iPhone4() {
        return ceil(value * q4)
    } else if UIDevice.current.iPhone5() {
        return ceil(value * q5)
    } else if UIDevice.current.iPhone6or7() {
        return ceil(value * q6)
    } else if UIDevice.current.iPhone6or7Plus() {
        return value * qPlus
    } else if UIDevice.current.iPhoneX() {
        return value * qx
    } else if UIDevice.current.iPhone14or14Pro() {
        return value * q12
    } else if UIDevice.current.iPhone14ProMax() {
        return value * q12ProMax
    } else {
        return value
    }
}
