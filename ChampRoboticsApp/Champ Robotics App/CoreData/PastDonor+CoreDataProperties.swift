//
//  PastDonor+CoreDataProperties.swift
//  Champ Robotics App
//
//  Created by noah rafael ortega on 12/6/19.
//  Copyright © 2019 noah rafael ortega. All rights reserved.
//
//

import Foundation
import CoreData


extension PastDonor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PastDonor> {
        return NSFetchRequest<PastDonor>(entityName: "PastDonor")
    }

    @NSManaged public var amount: Float
    @NSManaged public var date: NSDate
    @NSManaged public var name: String

}
