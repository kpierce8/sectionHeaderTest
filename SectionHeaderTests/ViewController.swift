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
    
    
    var sectionHeaders = ["kings landing","captured","pentos"]
    var sectionText = ["not a fun place", "there be bars of iron", "there be bars and wine is where all sorts of weird stuff happens but not as weird as in braavos, ewww"]
    
    var sectionData : [String : [String]] = ["kings landing": ["cersei", "joffrey", "tywin"],
                                             "captured" : ["jaime", "tyrion"],
                                             "pentos": ["tyrion"]]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerNib = UINib.init(nibName: "HeaderViewNib", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderViewNib")
        tableView.register(HeaderFromCode.self, forHeaderFooterViewReuseIdentifier: "section")
        tableView.register(HeaderWithConstraints.self, forHeaderFooterViewReuseIdentifier: "constraints")
   
        
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tableView.estimatedSectionHeaderHeight = 5

   //     self.tableView.rowHeight = UITableViewAutomaticDimension
   //     self.tableView.estimatedRowHeight = 40
    
        
        // https://stackoverflow.com/questions/1166236/light-gray-background-in-bounce-area-of-a-uitableview
       // let bgView = UIView()
       // bgView.backgroundColor = UIColor.white
        //self.tableView.backgroundView = bgView
        
    }



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
    
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return 25
//    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     let bob = 0
        
        if bob == 0 {
            let aSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewNib") as! HeaderViewNib
            aSection.headerLabel.text = sectionHeaders[section]
            if aSection.collapsed  == true {
                aSection.explanationLabel.text = ""
            } else {
                aSection.explanationLabel.text = sectionText[section]
            }
            
            print(aSection.contentView.viewWithTag(12)?.frame.height)
            //tableView.sectionHeaderHeight = aSection.headerLabel.frame.height + 20
            return aSection
        } else if bob == 1 {
//            let aSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "section") as! HeaderFromCode
//            aSection.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
//            aSection.backgroundView?.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
//
//            //aSection.backgroundView = bgView
//            //aSection.contentView.addSubview(bgView)
//
//            aSection.headerLabel.text = sectionHeaders[section]
//            aSection.headerLabel.sizeToFit()
//            tableView.sectionHeaderHeight = aSection.contentView.frame.height
//            print(aSection  .frame.height)
//           return aSection.contentView
        } else {
//            let aSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "constraints") as! HeaderWithConstraints
//            aSection.headerLabel.text = sectionHeaders[section]
//            print(aSection.contentView.frame.height)
//            tableView.sectionHeaderHeight = aSection.headerLabel.frame.height + 20
//            aSection.translatesAutoresizingMaskIntoConstraints = false
//            return aSection
        }
        
    
    }






}
