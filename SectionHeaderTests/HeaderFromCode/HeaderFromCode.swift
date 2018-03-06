//
//  HeaderFromCode.swift
//  SectionHeaderTests
//
//  Created by UberDominator on 3/5/18.
//  Copyright © 2018 Frantic Goose Applications. All rights reserved.
//

import UIKit

class HeaderFromCode: UITableViewHeaderFooterView {

    var headerLabel: UILabel!
    var showButton: UIButton!
    
    let itemHeights: CGFloat = 44.0
    let buttonWidth: CGFloat = 44.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("no init coder thing")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        headerLabel = UILabel()
        showButton = UIButton(frame: CGRect(x: 100, y: 3.0, width: buttonWidth, height: itemHeights))
        
        self.contentView.addSubview(headerLabel)
        self.contentView.addSubview(showButton)

        showButton.backgroundColor = UIColor.blue
    }

}
