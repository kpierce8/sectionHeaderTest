//
//  StringHeightExt.swift
//  SectionHeaderTests
//
//  Created by UberDominator on 3/11/18.
//  Copyright © 2018 Frantic Goose Applications. All rights reserved.
//

import UIKit
extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: font], context: nil)
        return boundingBox.height
    }
}
