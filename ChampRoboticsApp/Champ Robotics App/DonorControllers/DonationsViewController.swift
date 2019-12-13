//
//  DonationsViewController.swift
//  DemoGroupProject
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

import Foundation
import UIKit
class DonationsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var donorFields: [UITextField]! //first field
    @IBOutlet weak var studentName: UITextField!
    @IBOutlet weak var studentSchool: UITextField!
    @IBOutlet weak var studentID: UITextField!
    
    let model = ChampsModel.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentName.text = model.userName
        studentSchool.text = model.userSchool
        studentID.text = model.userSchoolID
        
        for index in 0..<donorFields.count {
            donorFields[index].delegate = self
            donorFields[index].tag = 64 + index
            print(donorFields[index].tag)
        }
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false
    }
    
    
}
