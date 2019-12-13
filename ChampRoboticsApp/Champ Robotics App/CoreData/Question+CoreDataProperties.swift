//
//  Question+CoreDataProperties.swift
//  Champ Robotics App
//
//  Created by Komasquin Lopez on 12/10/19.
//  Copyright © 2019 noah rafael ortega. All rights reserved.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var answerList: [String]?
    @NSManaged public var question: String
    @NSManaged public var userAnswer: String?
    @NSManaged public var belongsTo: Survey?

}
