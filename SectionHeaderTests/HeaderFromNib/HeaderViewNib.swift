//
//  HeaderViewNib.swift
//  SectionHeaderTests
//
//  Created by UberDominator on 3/4/18.
//  Copyright © 2018 Frantic Goose Applications. All rights reserved.
//

import UIKit

class HeaderViewNib: UITableViewHeaderFooterView {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var explanationView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBAction func toggleHeaderBtn(_ sender: UIButton) {
    }
   
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
