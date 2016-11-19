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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension FeedViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (RouteManager.instance.getRoutes()?.count)!
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        MainTableViewCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"MainTableViewCell" owner:self options:nil] firstObject];
        
        let cell = Bundle.main.loadNibNamed("HAFeedCell", owner: self, options: nil)?.first as! HAFeedCell
        cell.routeModel = RouteManager.instance.getRoutes()?[indexPath.row]
        
        return cell
    }
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
