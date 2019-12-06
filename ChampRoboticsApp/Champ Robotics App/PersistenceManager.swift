//
//  PersistenceManager.swift
//  Champ Robotics App
//
//  Created by noah rafael ortega on 12/5/19.
//  Copyright © 2019 noah rafael ortega. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager{
    
    private init() {}
    
    static let sharedInstance = PersistenceManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        //model instantiation
        let container = NSPersistentContainer(name: "Champ_Robotics_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("!!! Unresolved coreData error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    lazy var context  = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
                print(">>>Saved Context")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error saving context \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchAll<T:NSManagedObject>(_ objectType: T.Type) -> [T] {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
    
    //creates core data employee object
    func createLeaderBoardEntry(name:String, school:String){
        let entry = Leaderboard(context: context)
        entry.name = name
        entry.school = school
        saveContext()
    }
    
    func createPastDonor(name:String, date: NSDate, amount: Float) {
        let donor = PastDonor(context: context)
        donor.name = name
        donor.date = date
        donor.amount = amount
    }
    
    //creates core data employee object
    func createEvent(title: String){
        let event = Event(context: context)
        event.title = title
        event.website = "www.defaultwebsite.com"
        saveContext()
    }
    
    func resetType<T:NSManagedObject>(_ objectType: T.Type) {
        let entityName = String(describing: objectType)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
            saveContext()
        } catch {
            print("reset of \(entityName) failed ")
        }
    }
    
}

