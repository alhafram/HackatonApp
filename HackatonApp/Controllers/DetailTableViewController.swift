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
    
    var route: RouteModel? = nil
    
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
        
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 10, y: 20, width: 22, height: 22)
        
        button.setImage(UIImage(named: "back1600")?.withRenderingMode(.alwaysTemplate), for: UIControlState())

        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(backViewController(button :)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func backViewController(button: AnyObject) -> Void {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBottomBorderColor(color: UIColor.red,height: 1.0)
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        

        indicator1.frame = CGRect(x: 30, y: 50, width: 80, height: 80)
        indicator1.setBackgroundImage(UIImage(named: "oval.pdf"), for: .normal)
        indicator1.setTitle("\((route?.rating)!)\nрейтинг", for: .normal)
        indicator1.titleLabel?.textAlignment = .center
        indicator1.titleLabel?.lineBreakMode = .byWordWrapping
        view.addSubview(indicator1)
        
        indicator2.frame = CGRect(x: 150, y: 50, width: 80, height: 80)
        indicator2.setBackgroundImage(UIImage(named: "oval.pdf"), for: .normal)
        indicator2.setTitle("\((route?.price)!)\nцена", for: .normal)
        indicator2.titleLabel?.textAlignment = .center
        indicator2.titleLabel?.lineBreakMode = .byWordWrapping
        view.addSubview(indicator2)
        
        indicator3.frame = CGRect(x: 270, y: 50, width: 80, height: 80)
        indicator3.setBackgroundImage(UIImage(named: "oval.pdf"), for: .normal)
        indicator3.setTitle("\((route?.duration)!)ч.\nвремя", for: .normal)
        indicator3.titleLabel?.textAlignment = .center
        indicator3.titleLabel?.lineBreakMode = .byWordWrapping
        view.addSubview(indicator3)
        
        let swipeIV = UIImageView.init(frame: CGRect(x: 175, y: 260, width: 50, height: 20))
        swipeIV.image = UIImage(named: "swipe")
        
        view.addSubview(swipeIV)
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
        header.imageView.image = route?.cover
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            let cell = Bundle.main.loadNibNamed("TitleViewCell", owner: self, options: nil)?.first as! TitleViewCell
            cell.nameStr = route?.name;
            
            return cell
        } else if indexPath.row == 2 {
            let cell = Bundle.main.loadNibNamed("DescViewCell", owner: self, options: nil)?.first as! DescViewCell
            cell.descText = route?.descr;
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 150
        } else if (indexPath.row == 1) {
            return 44
        } else {
            return UITableViewAutomaticDimension
        }
    }

}
