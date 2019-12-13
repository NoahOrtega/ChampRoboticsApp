//
//  PersistenceManager.swift
//  Champ Robotics App
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

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
    
    func fetchAllAsArray<T:NSManagedObject>(_ objectType: T.Type) -> [T] {
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
    
    func printAll<T:NSManagedObject>(_ objectType: T.Type){
        print("printing all \(T.Type.self)")
        let arrayOfAll = fetchAllAsArray(T.self)
        
        for i in arrayOfAll {
            print(i)
            }
    }
    
    //creates core data leaderboard object
    func createLeaderBoardEntry(name:String, school:String, rank:Int16 ){
        let entry = LeaderBoard(context: context)
        entry.name = name
        entry.school = school
        entry.rank = rank
    }
    //creates core data donor object
    func createPastDonor(name:String, date: NSDate, amount: Float) {
        let donor = PastDonor(context: context)
        donor.name = name
        donor.date = date
        donor.amount = amount
    }
    
    //creates core data event object
    func createEvent(title: String, start: NSDate?, end: NSDate?){
        let event = Event(context: context)
        event.title = title
        event.website = "www.defaultwebsite.com"
        event.descript = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tortor dolor, sagittis ac risus eget, finibus interdum erat. Nulla neque eros, dictum at lorem quis, interdum rhoncus tortor. Nunc justo erat, egestas faucibus pulvinar eget, efficitur a erat. Donec eu laoreet neque. Fusce finibus, ipsum vel cursus placerat, urna erat commodo orci, vitae ultrices libero neque vel massa. Donec sed augue tincidunt, finibus metus ac, interdum elit."
        event.startDate = start
        event.endDate = end
        event.visited = false
    }
    
    //creates core data survey object
    func createSurvey () -> Survey {
        let mySurvey = Survey(context: context)
        return mySurvey
    }
    
    
    func createQuestion (name: String, answers: [String], survey: Survey) {
        let myQuestion = Question(context: context)
        myQuestion.question = name
        myQuestion.answerList = answers
        survey.addToHasQuestion(myQuestion)
    }
    
    func resetType<T:NSManagedObject>(_ objectType: T.Type) {
        let entityName = String(describing: objectType)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
            print(">>>Reset: \(entityName)")
        } catch {
            print("CoreData: reset of \(entityName) failed ")
        }
    }
    
}

