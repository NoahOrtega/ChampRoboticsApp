//
//  DonorTabViewController.swift
//  DemoGroupProject
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

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
