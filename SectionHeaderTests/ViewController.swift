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
    
    let sectionHeaders = ["kings landing","captured","pentos"]
    //let sectionHeaders = ["kings landing"]
    let sectionText = ["not a fun place plus a bunch of tother stuff to make a longer label", "there be bars of iron", "there be bars and wine is where all sorts of weird stuff happens but not as weird as in braavos, ewww"]
    let sectionData : [String : [String]] = ["kings landing": ["cersei", "joffrey", "tywin"],
                                             "captured" : ["jaime", "tyrion"],
                                             "pentos": ["tyrion", "varesh"]]
    
    var sectionCollapsed = [String: Bool]()
    var headerHeight = [Int: CGFloat]()
    var tvWidth: CGFloat = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerNib = UINib.init(nibName: "HeaderViewNib", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderViewNib")
        tableView.register(HeaderFromCode.self, forHeaderFooterViewReuseIdentifier: "section")
        tableView.register(HeaderWithConstraints.self, forHeaderFooterViewReuseIdentifier: "constraints")
        tvWidth = tableView.frame.size.width
        for sec in 0..<sectionHeaders.count {
            sectionCollapsed[sectionHeaders[sec]] = true
           headerHeight[sec] = sectionText[sec].heightWithConstrainedWidth(width: tvWidth, font: UIFont.preferredFont(forTextStyle: .body)) + 40 + 4
        }
        
      //  self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, HeaderViewNibDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[sectionHeaders[section]]?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        print("sectionText calculated height for section \(section) is \(sectionText[section].heightWithConstrainedWidth(width: tvWidth, font: UIFont.preferredFont(forTextStyle: .body)))")
        
        return sectionCollapsed[sectionHeaders[section]]! ? headerHeight[section]! :40.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = sectionData[sectionHeaders[indexPath.section]]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data?[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let aSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewNib") as! HeaderViewNib
            aSection.headerLabel.text = sectionHeaders[section]
            aSection.delegate = self
            aSection.section = section
            aSection.explanationLabel.text = sectionText[section]
            return aSection
    }
    
        func toggleHeaderBtn(section: Int) {
            sectionCollapsed[sectionHeaders[section]]  = !sectionCollapsed[sectionHeaders[section]]!
            tableView.beginUpdates()
            tableView.reloadSections([section], with: .automatic)  // <- that's a place for an animation effect woo hoo!
            tableView.endUpdates()
        }
    
    
    
    
}
