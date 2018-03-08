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
    
    let itemHeights: CGFloat = 40.0
    let buttonWidth: CGFloat = 44.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("no init coder thing")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        headerLabel = UILabel()
        showButton = UIButton(frame: CGRect(x: 120, y: 5.0, width: buttonWidth, height: itemHeights))
        let bgView = UIView()
        bgView.backgroundColor = UIColor(hue: 0.9, saturation: 0.1, brightness: 0.9, alpha: 0.5)
        bgView.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 70)
        bgView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 70)
        bgView.addSubview(headerLabel)
        bgView.addSubview(showButton)
        self.contentView.addSubview(bgView)


        showButton.backgroundColor = UIColor.blue
    }

}
