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
        let newView = UIView()
        
        
        newView.addSubview(headerLabel)
        newView.addSubview(showButton)
        self.contentView.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.topAnchor.constraint(equalTo: newView.superview!.topAnchor).isActive = true
        //newView.bottomAnchor.constraint(equalTo: newView.superview!.bottomAnchor).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.leadingAnchor.constraint(equalTo: newView.superview!.leadingAnchor).isActive = true
        newView.trailingAnchor.constraint(equalTo: newView.superview!.trailingAnchor).isActive = true
        newView.backgroundColor = UIColor(hue: 0.8, saturation: 0.2, brightness: 0.9, alpha: 1.0)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.leadingAnchor.constraint(equalTo: headerLabel.superview!.leadingAnchor, constant: 5).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerLabel.superview!.centerYAnchor).isActive = true
        
        showButton.translatesAutoresizingMaskIntoConstraints = false
        showButton.trailingAnchor.constraint(equalTo: showButton.superview!.trailingAnchor, constant: -10).isActive = true
        showButton.centerYAnchor.constraint(equalTo: showButton.superview!.centerYAnchor).isActive = true
        showButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        showButton.heightAnchor.constraint(equalToConstant: itemHeights).isActive = true
        showButton.backgroundColor = UIColor.blue
        print("superview width is \(showButton.superview!.frame.width)")
        
        
        
    }


}
