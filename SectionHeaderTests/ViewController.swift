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
    
    var sectionCollapsed = [String: Bool]()
    var headerHeight = [Int: CGFloat]()
     var sectionHeaders = ["kings landing","captured","pentos"]
    //var sectionHeaders = ["pentos", "kings landing"]
    var sectionText = ["not a fun place plus a bunch of tother stuff to make a longer label", "there be bars of iron", "there be bars and wine is where all sorts of weird stuff happens but not as weird as in braavos, ewww"]
    
    var sectionData : [String : [String]] = ["kings landing": ["cersei", "joffrey", "tywin"],
                                             "captured" : ["jaime", "tyrion"],
                                             "pentos": ["tyrion", "varesh"]]
    
    var myHeight: CGFloat = 150.0
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
           headerHeight[sec] = sectionText[sec].heightWithConstrainedWidth(width: tvWidth, font: UIFont.preferredFont(forTextStyle: .body)) + 40
        }
        
        
        
        
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension

    
        
        // https://stackoverflow.com/questions/1166236/light-gray-background-in-bounce-area-of-a-uitableview
       // let bgView = UIView()
       // bgView.backgroundColor = UIColor.white
        //self.tableView.backgroundView = bgView
        
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

            
            print(aSection.headerLabel.frame.height)
        
            print(aSection.explanationLabel.frame.height)
        
            return aSection
    }
    
        func toggleHeaderBtn(header: HeaderViewNib, section: Int) {
            sectionCollapsed[sectionHeaders[section]]  = !sectionCollapsed[sectionHeaders[section]]!
            
            //myHeight = sectionCollapsed[sectionHeaders[section]]! ? 40.0 : headerHeight[section]!
             
            
            tableView.beginUpdates()
            tableView.reloadSections([section], with: .automatic)
            tableView.endUpdates()
        }
    
    
    
    
}
