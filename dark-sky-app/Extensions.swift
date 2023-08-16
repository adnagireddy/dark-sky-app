//
//  Extensions.swift
//  dark-sky-app
//
//  Created by Ananya Nagireddy on 8/14/23.
//

import Foundation
import SwiftUI

//Extensions:
/*
 
 Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you don’t have access to the original source code (known as retroactive modeling). Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions don’t have names.)

 Extensions in Swift can:

 Add computed instance properties and computed type properties

 Define instance methods and type methods

 Provide new initializers

 Define subscripts

 Define and use new nested types

 Make an existing type conform to a protocol
 
 */


//purpose: round all data values in JSON file to doubles to make it usable for the app
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
    
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
