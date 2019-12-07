//
//  LeaderBoard+CoreDataProperties.swift
//  Champ Robotics App
//
//  Created by noah rafael ortega on 12/6/19.
//  Copyright © 2019 noah rafael ortega. All rights reserved.
//
//

import Foundation
import CoreData


extension LeaderBoard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LeaderBoard> {
        return NSFetchRequest<LeaderBoard>(entityName: "LeaderBoard")
    }

    @NSManaged public var name: String
    @NSManaged public var rank: Int16
    @NSManaged public var school: String

}
