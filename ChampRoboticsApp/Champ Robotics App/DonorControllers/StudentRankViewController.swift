//
//  StudentRankViewController.swift
//  DemoGroupProject
//
//  Created by Komasquin Lopez on 11/14/19.
//  Copyright © 2019 Komasquin Lopez. All rights reserved.
//

import Foundation
import UIKit

class StudentRankViewController: UITableViewController{
    var item: [String] = ["Cool Guy","Moss Lopez","Mike forgo","Noah Ortega","Carlos ortega","Hector Hernandez","Justin Bieber","Justin Timberlake","Nikki Mono", "Nancy Grace", "Coolman Global","Sexy Panther", "Ruby Lopez","Python Aston","Party Patter","Susie Vega", "Movie Day"]
    
    var date: [String] = ["1","2","3","4","5","6","7","8","9","10","11", "12","13","14","15","16","17"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    //mandatory for table view
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3",
                                                 for: indexPath)
        
        let item2 = item[indexPath.row]
        let item3 = date[indexPath.row]
        cell.textLabel?.text = "\(item3)"
        cell.detailTextLabel?.text = "\(item2)"
        
        return cell
    }
}
