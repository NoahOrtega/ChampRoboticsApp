//
//  Survey+CoreDataProperties.swift
//  Champ Robotics App
//
//  Created by Komasquin Lopez on 12/10/19.
//  Copyright © 2019 noah rafael ortega. All rights reserved.
//
//

import Foundation
import CoreData


extension Survey {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Survey> {
        return NSFetchRequest<Survey>(entityName: "Survey")
    }

    @NSManaged public var hasQuestion: NSSet?

}

// MARK: Generated accessors for hasQuestion
extension Survey {

    @objc(addHasQuestionObject:)
    @NSManaged public func addToHasQuestion(_ value: Question)

    @objc(removeHasQuestionObject:)
    @NSManaged public func removeFromHasQuestion(_ value: Question)

    @objc(addHasQuestion:)
    @NSManaged public func addToHasQuestion(_ values: NSSet)

    @objc(removeHasQuestion:)
    @NSManaged public func removeFromHasQuestion(_ values: NSSet)

}
