//
//  Event+CoreDataProperties.swift
//  Champ Robotics App
//
//  Created by noah rafael ortega on 12/6/19.
//  Copyright © 2019 noah rafael ortega. All rights reserved.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var endDate: NSDate?
    @NSManaged public var picture: NSData?
    @NSManaged public var startDate: NSDate?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String
    @NSManaged public var visited: Bool
    @NSManaged public var website: String?

}
