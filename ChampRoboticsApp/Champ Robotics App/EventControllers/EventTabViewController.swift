//
//  EventTabViewController.swift
//  DemoGroupProject
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

import UIKit
import CoreData

class EventTabViewController: UITableViewController, UISearchBarDelegate {
    
    let model = ChampsModel.sharedInstance
    let data = PersistenceManager.sharedInstance
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Event")

    @IBOutlet weak var searchBar: UISearchBar!
    
    var orderEventAlertSheet:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: model.eventSortAttributekey, ascending: true)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: data.context, sectionNameKeyPath: nil, cacheName: nil)
        
        searchBar.delegate = self
        orderEventAlertSheet = createEventSearchAlertSheet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    func reloadData() {
        do {try fetchedResultsController.performFetch()}
        catch {print("CoreData: couldnt fetch events")}
        tableView.reloadData()
    }
    
    //required tableview functions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.eventToDisplay = fetchedResultsController.object(at: indexPath) as? NSManagedObject
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "event") //, forIndexPath: indexPath
        let event = fetchedResultsController.object(at: indexPath) as! Event
        
        cell?.textLabel?.text = "\(event.title)"
        cell?.detailTextLabel?.text = "\(model.getEventDateText(event: event))"
        return cell!
    }
    
    //search bar text update
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText != "") {
            fetchRequest.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            reconstructFetchedResults()
        }
        else {
            fetchRequest.predicate = nil
            reconstructFetchedResults()
        }
    }
    
    func reconstructFetchedResults() {
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: data.context, sectionNameKeyPath: nil, cacheName: nil)
        reloadData()
    }
    
    func createEventSearchAlertSheet() -> UIAlertController {
        let alert = UIAlertController(title: "Sort By:", message: "Sort the list of events.", preferredStyle: .actionSheet)
        let sortTitle = UIAlertAction(title: "Title", style: .default) { (action) in
            self.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
            self.reconstructFetchedResults()
        }
        let sortStart = UIAlertAction(title: "Start Date", style: .default) { (action) in
            self.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "startDate", ascending: true), NSSortDescriptor(key: "endDate", ascending: true)]
            self.reconstructFetchedResults()
        }
        let sortDeadline = UIAlertAction(title: "Deadline", style: .default) { (action) in
            self.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "endDate", ascending: true), NSSortDescriptor(key: "startDate", ascending: true)]
            self.reconstructFetchedResults()
        }
        alert.addAction(sortTitle)
        alert.addAction(sortStart)
        alert.addAction(sortDeadline)
        return alert
    }
    
    
    @IBAction func OpenSortingActionSheet(_ sender: UIBarButtonItem) {
        orderEventAlertSheet.popoverPresentationController?.barButtonItem = sender
        self.present(orderEventAlertSheet, animated: true)
    }
}
