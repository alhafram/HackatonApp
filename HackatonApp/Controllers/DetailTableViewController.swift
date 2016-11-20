//
//  DetailTableViewController.swift
//  HackatonApp
//
//  Created by Albert on 20/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

import UIKit
import StretchHeader

class DetailTableViewController: UITableViewController {
    
    var header : StretchHeader!
    var navigationView = UIView()
    var indicator1 = UIButton(type: .custom)
    var indicator2 = UIButton(type: .custom)
    var indicator3 = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareNaviagationHeader()
        self.prepareHeaderView()
        self.indicator1.alpha = 0
        self.indicator2.alpha = 0
        self.indicator3.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func prepareNaviagationHeader() -> Void {
        let navibarHeight : CGFloat = 40
        let statusbarHeight : CGFloat = UIApplication
            .shared
            .statusBarFrame
            .size
            .height
        navigationView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: navibarHeight + statusbarHeight
        )
        navigationView.backgroundColor = UIColor(
            red: 121/255.0,
            green: 193/255.0,
            blue: 203/255.0,
            alpha: 1.0
        )
        navigationView.alpha = 0.0
        view.addSubview(navigationView)
        

        indicator1.frame = CGRect(x: 30, y: 50, width: 70, height: 70)
        indicator1.setImage(UIImage(named: "indicator")?.withRenderingMode(.alwaysTemplate), for: UIControlState())
        indicator1.tintColor = UIColor.white
        view.addSubview(indicator1)
        
        indicator2.frame = CGRect(x: 175, y: 50, width: 70, height: 70)
        indicator2.setImage(UIImage(named: "indicator")?.withRenderingMode(.alwaysTemplate), for: UIControlState())
        indicator2.tintColor = UIColor.white
        view.addSubview(indicator2)
        
        indicator3.frame = CGRect(x: 314, y: 50, width: 70, height: 70)
        indicator3.setImage(UIImage(named: "indicator")?.withRenderingMode(.alwaysTemplate), for: UIControlState())
        indicator3.tintColor = UIColor.white
        view.addSubview(indicator3)
    }
    
    func prepareHeaderView() {
        let options = StretchHeaderOptions()
        options.position = .fullScreenTop
        header = StretchHeader()
        header.stretchHeaderSize(
            headerSize: CGSize(
                width: view.frame.size.width,
                height: 160
            ),
                imageSize: CGSize(
                    width: view.frame.size.width,
                    height: 300
            ),
                controller: self,
                options: options)
        header.imageView.image = UIImage(named: "navHeader")
        tableView.tableHeaderView = header
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        header.updateScrollViewOffset(scrollView)
        
        let offset : CGFloat = scrollView.contentOffset.y
        if (offset < 50) {

            if scrollView.contentOffset.y < 0 {
                indicator1.alpha = abs(scrollView.contentOffset.y/100)
                indicator2.alpha = abs(scrollView.contentOffset.y/100)
                indicator3.alpha = abs(scrollView.contentOffset.y/100)
            }

            
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        //cell.textLabel?.text = "index -- \((indexPath as NSIndexPath).row)"
        return UITableViewCell()
    }

}
