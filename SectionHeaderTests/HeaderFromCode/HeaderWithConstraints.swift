//
//  HeaderWithConstraints.swift
//  SectionHeaderTests
//
//  Created by UberDominator on 3/5/18.
//  Copyright © 2018 Frantic Goose Applications. All rights reserved.
//

import UIKit

class HeaderWithConstraints: UITableViewHeaderFooterView {

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
        showButton = UIButton()
        
        
        self.contentView.addSubview(headerLabel)
        self.contentView.addSubview(showButton)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.leadingAnchor.constraint(equalTo: headerLabel.superview!.leadingAnchor, constant: 5).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerLabel.superview!.centerYAnchor).isActive = true
        
        showButton.translatesAutoresizingMaskIntoConstraints = false
        showButton.trailingAnchor.constraint(equalTo: showButton.superview!.trailingAnchor, constant: -10).isActive = true
        showButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        showButton.heightAnchor.constraint(equalToConstant: itemHeights).isActive = true
        showButton.backgroundColor = UIColor.blue
        print("superview width is \(showButton.superview!.frame.width)")
        
        
        
    }


}
