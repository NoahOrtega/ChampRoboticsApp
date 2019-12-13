//
//  MostRecentDonorsViewCotroller.swift
//  DemoGroupProject
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

import UIKit
import CoreData

class MostRecentDonorsViewController: UITableViewController {
    
    let model = ChampsModel.sharedInstance
    let data = PersistenceManager.sharedInstance
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PastDonor")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "date", ascending: true)
        ]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: data.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func reloadData() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("coredata: couldnt fetch donors")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "donor") //, forIndexPath: indexPath
        let donor = fetchedResultsController.object(at: indexPath) as! PastDonor
        
        cell?.textLabel?.text = "\(donor.name)"
        cell?.detailTextLabel?.text = "$\(donor.amount)"
        return cell!
    }
    
}
