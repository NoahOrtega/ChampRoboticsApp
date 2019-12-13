//
//  DonorAgreementViewController.swift
//  DemoGroupProject
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

import Foundation
import UIKit

class DonorAgreementViewController: UIViewController {
    
    
    
    
    @IBAction func agreeButton(_ sender: Any) {
        performSegue(withIdentifier: "Donate", sender: sender)
    }
}
