//
//  Leaderboard+CoreDataProperties.swift
//  Champ Robotics App
//
//  Created by noah rafael ortega on 12/5/19.
//  Copyright © 2019 noah rafael ortega. All rights reserved.
//
//

import Foundation
import CoreData


extension Leaderboard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Leaderboard> {
        return NSFetchRequest<Leaderboard>(entityName: "Leaderboard")
    }

    @NSManaged public var name: String
    @NSManaged public var school: String

}
