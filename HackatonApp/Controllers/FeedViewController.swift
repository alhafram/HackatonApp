//
//  FeedViewController.swift
//  HackatonApp
//
//  Created by Каратаев Алексей on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

import UIKit
import Segmentio

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func prepareSegmentedControl() -> Void {
        
        let items: [SegmentioItem] = [
            SegmentioItem(
                title: "Популярное",
                image: nil
            ),
            SegmentioItem(
                title: "Главная",
                image: nil
            ),
            SegmentioItem(
                title: "Избранное",
                image: nil
            )
        ]
        
        let segmentedControl = CBSegmentedControl(
            items: items,
            view: self.view,
            handler: self.segmentedControlCallback
        )
        
        segmentedControl.index = 1
    }
    
    func prepreNavigationBar() -> Void {
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?
            .navigationBar
            .setBottomBorderColor(
                color: UIColor.red,
                height: 1
        )
    }
    
    func segmentedControlCallback(
        _ segmentio: Segmentio, _ selectedSegmentioIndex: Int) -> Void {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepreNavigationBar()
        self.prepareSegmentedControl()
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: NSNotification.Name(rawValue: "UPDATE_UI"), object: nil)
    }
    
    func updateUI() -> Void {
//        RouteManager.instance.getRoutes()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSettingsVC(_ sender: AnyObject) {
        let settingsVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
}

extension FeedViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (RouteManager.instance.getRoutes()?.count)!
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("HAFeedCell", owner: self, options: nil)?.first as! HAFeedCell
        cell.routeModel = RouteManager.instance.getRoutes()?[indexPath.row]
        
        return cell
    }
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailTableViewController") as! DetailTableViewController
        vc.route = RouteManager.instance.getRoutes()?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
