//
//  StringManager.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-30.
//

import Foundation
import UIKit

extension String {
    
    //for crossed out text
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
