//
//  EventDetailsViewController.swift
//  DemoGroupProject
//
//  Created by Komasquin Lopez on 11/14/19.
//  Copyright © 2019 Komasquin Lopez. All rights reserved.
//

import Foundation
import UIKit

class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleBox: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleBox.layer.borderWidth = 2
        titleBox.layer.borderColor = (UIColor.lightGray).withAlphaComponent(0.1).cgColor
    }
    
    
}
