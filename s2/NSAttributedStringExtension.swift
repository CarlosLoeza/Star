//
//  NSAttributedStringExtension.swift
//  s2
//
//  Created by Carlos Loeza on 7/5/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import Foundation


extension NSAttributedString{
    
    // for path: URL link
    // in string: the string in the textview
    // as substring: the word in the sentence that is clickable for the URL to open
    static func makeHyperLink(for path: String, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: substringRange)
        return attributedString
    }
    
    
}
