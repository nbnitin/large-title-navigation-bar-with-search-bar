//
//  ViewController.swift
//  SampleNavigationWithSearchBar
//
//  Created by Nitin on 18/12/19.
//  Copyright © 2019 Nitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let controller = UISearchController(searchResultsController: nil)
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBar.hideBorderLine()
        tblView.delegate = self
        tblView.dataSource = self
        // Do any additional setup after loading the view.
       // controller.searchResultsUpdater = self as? UISearchResultsUpdating
//        controller.obscuresBackgroundDuringPresentation = false
//        controller.searchBar.placeholder = "Search Candies"
//        definesPresentationContext = true
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 11.0, *) {
            
            navigationItem.searchController = controller
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            navigationItem.titleView = controller.searchBar
        }
        
        //change color of navigation bar with large titles
       let app = UINavigationBarAppearance()
        app.backgroundColor = .blue
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        cell.textLabel!.text = "\(indexPath.row)"
        return cell
    }


}





