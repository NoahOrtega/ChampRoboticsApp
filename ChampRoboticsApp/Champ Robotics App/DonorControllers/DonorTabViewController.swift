//
//  DonorTabViewController.swift
//  DemoGroupProject
//
//  Created by Komasquin Lopez on 11/14/19.
//  Copyright © 2019 Komasquin Lopez. All rights reserved.
//

import Foundation
import UIKit

class DonorTabViewController: UIViewController {
    @IBAction func studentRank(_ sender: Any) {
        performSegue(withIdentifier: "StudentRank", sender: sender)
    }
    @IBAction func recentDonors(_ sender: Any) {
        performSegue(withIdentifier: "RecentDonors", sender: sender)
    }
    @IBAction func challengeRules(_ sender: Any) {
        performSegue(withIdentifier: "ChallengeRules", sender: sender)
    }
    @IBAction func donationProcess(_ sender: Any) {
        performSegue(withIdentifier: "DonationProcess", sender: sender)
    }
}
