//
//  ViewController.swift
//  SectionHeaderTests
//
//  Created by UberDominator on 3/4/18.
//  Copyright © 2018 Frantic Goose Applications. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerNib = UINib.init(nibName: "HeaderViewNib", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderViewNib")
        tableView.register(HeaderFromCode.self, forHeaderFooterViewReuseIdentifier: "section")
        tableView.register(HeaderWithConstraints.self, forHeaderFooterViewReuseIdentifier: "constraints")
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
       // tableView.estimatedSectionHeaderHeight = 25;
        
    }

    var sectionHeaders = ["kings landing","captured","pentos"]
    var sectionText = ["not a fun place", "there be bars of iron", "there be bars and wine"]
    
    var sectionData : [String : [String]] = ["kings landing": ["cersei", "joffrey", "tywin"],
                                             "captured" : ["jaime", "tyrion"],
                                             "pentos": ["tyrion"]]
    
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[sectionHeaders[section]]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = sectionData[sectionHeaders[indexPath.section]]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data?[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50.0
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        if sectionHeaders[section] == "pentos" {
            let aSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewNib") as! HeaderViewNib
            aSection.headerLabel.text = sectionHeaders[section]
            return aSection
        } else if section == 0 {
            let aSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "section") as! HeaderFromCode
            //aSection.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
            //aSection.backgroundView?.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
            //aSection.backgroundView?.backgroundColor =  UIColor(hue: 0.2, saturation: 0.5, brightness: 0.5, alpha: 1.0)
            //aSection.contentView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
            aSection.headerLabel.text = sectionHeaders[section]
            aSection.headerLabel.sizeToFit()
            //print("tableview width is \(tableView.frame.width)")
            //aSection.setNeedsLayout()
           return aSection
        } else {
            let aSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "constraints") as! HeaderWithConstraints
            aSection.headerLabel.text = sectionHeaders[section]
            return aSection
        }
        
    
    }






}
