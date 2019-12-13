//
//  EventDetailsViewController.swift
//  DemoGroupProject
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

import UIKit

class EventDetailsViewController: UIViewController {
    
    let model = ChampsModel.sharedInstance
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var navTitle: UINavigationItem!
    @IBOutlet weak var headerBox: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var checkedInIndicator: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerBox.layer.borderWidth = 2
        headerBox.layer.borderColor = (UIColor.lightGray).withAlphaComponent(0.1).cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let event = model.eventToDisplay as! Event
        navTitle.title = event.title
        headerLabel.text = model.getEventDateText(event: event)
        descriptionLabel.text = event.descript ?? "No description."
        websiteLabel.text = event.website
        addressLabel.text = event.location ?? "11200 SW 8th St ECS 354, Miami, FL 33199" //change to "No address"
        //TODO: add addresses
        //TODO: add picture support
        
        if(event.visited) {
            checkedInIndicator.alpha = 1.0
        } else {
            checkedInIndicator.alpha = 0.0
        }
    }
    
    @IBAction func checkInPressed(_ sender: Any) {
        checkedInIndicator.alpha = 1.0
    }
}
