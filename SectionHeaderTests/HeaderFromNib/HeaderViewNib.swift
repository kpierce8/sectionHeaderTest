//
//  HeaderViewNib.swift
//  SectionHeaderTests
//
//  Created by UberDominator on 3/4/18.
//  Copyright © 2018 Frantic Goose Applications. All rights reserved.
//

import UIKit

protocol HeaderViewNibDelegate {
    func toggleHeaderBtn(header: HeaderViewNib, section: Int)
}

class HeaderViewNib: UITableViewHeaderFooterView {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var explanationView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var explanationLabel: UILabel!
    
  //  @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    var collapsed: Bool = false
    var delegate: HeaderViewNibDelegate?
    var section: Int!
    
    
    
    @IBAction func toggleHeaderBtnWasPressed(_ sender: UIButton) {
      delegate?.toggleHeaderBtn(header: self, section: section)
    }
   
    
    

}
