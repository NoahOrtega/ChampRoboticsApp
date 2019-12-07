//
//  StudentRankViewController.swift
//  DemoGroupProject
//
//  Created by Komasquin Lopez on 11/14/19.
//  Copyright © 2019 Komasquin Lopez. All rights reserved.
//

import UIKit
import CoreData

class StudentRankViewController: UITableViewController{
    
    let model = ChampsModel.sharedInstance
    let data = PersistenceManager.sharedInstance
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LeaderBoard")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "rank", ascending: true)
        ]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: data.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func reloadData() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("coredata: couldnt fetch events")
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rank") //, forIndexPath: indexPath
        let rank = fetchedResultsController.object(at: indexPath) as! LeaderBoard
        
        cell?.textLabel?.text = "\(rank.name)"
        cell?.detailTextLabel?.text = "\(rank.school)"
        return cell!
    }
    
}
