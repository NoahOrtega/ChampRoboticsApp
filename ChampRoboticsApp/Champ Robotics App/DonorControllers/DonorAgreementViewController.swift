//
//  DonorAgreementViewController.swift
//  DemoGroupProject
//
//  Created by Komasquin Lopez on 11/14/19.
//  Copyright © 2019 Komasquin Lopez. All rights reserved.
//

import Foundation
import UIKit

class DonorAgreementViewController: UIViewController {
    @IBAction func agreeButton(_ sender: Any) {
        performSegue(withIdentifier: "Donate", sender: sender)
    }
}
