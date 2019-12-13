//
//  ChampsModel.swift
//  DemoGroupProject
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

import Foundation
import CoreData

//struct for donor information to be used in app
//MostRecentDonorsViewController
//DonorAgreementViewController
struct donors {
    var donorFirstName: String!
    var donorLastName: String!
    var donorEmail: String!
    var donationAmount: Int!
    var donorAgreementPressed: Bool!
}

//struct for donor information to be used in app
//StudentRankViewController
//LoginViewController <------- Future imp
struct student {
    var studentName: String!
    var studentSchool: String!
    var studentID: String!
    var ytdDonations: Int!
    var quarterlydonations: Int!
}

final class ChampsModel {
    //singleton instance
    static let sharedInstance = ChampsModel()
    let data = PersistenceManager.sharedInstance
    
    //ChallengeViewController <----------------------------------------------------------Controller
    var currentChallengeDescription: String!
    var currentChanllengeRules: String!
    
    var eventToDisplay:NSManagedObject?
    
    var eventSortAttributekey = "title"
    
    var userName = "Maria Gutiérrez"
    var userSchool = "South Miami Middle"
    var userSchoolID = "8037434"
    
    //init arrays with a test and can change to admin later???
    init () {
        
    }
    
    func userCheckIn() {
        let event = eventToDisplay!
        event.setValue(true, forKey: "visited")
        data.saveContext()
    }
    
    func getEventDateText(event:Event) -> String {
        
        var startText:String? = nil
        var endText:String? = nil

        if let startDate = event.startDate{
            startText = DateFormatter.localizedString(from: startDate as Date, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.none)
        }
        if let endDate = event.endDate {
            endText = DateFormatter.localizedString(from: endDate as Date, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.none)
        }
        
        if(startText == nil && endText == nil) {
            return "No deadline"
        }
        else if (startText == nil) {
            return "Deadline: \(endText!)"
        }
        else if (endText == nil) {
            return "\(startText!)"
        }
        else {
            return "\(startText!) to \(endText!)"
        }
    }
    
    func getDateFromText(date:String?) -> NSDate? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM/dd/yyyy"
        if (date != nil) {
            let asDate = dateFormatterGet.date(from:date!) as NSDate?
            return asDate
        }
        return nil
    }
    
    
    func initDummyData(should: Bool) {
        
        if(should) {
            let eventTitles: [String] = ["FIU Mobile Robotics Social","Mentor Weekend at FIU","Swift Workshop","Mobile Robotics Workshop","Girls Who Code Event","Make a Plane","Educational Lectures Online","JAVA Workshop","Capture the Flag", "Java Practice Code", "Hackathon","FIU Panther Night", "Ruby Code Workshop","Python Workshop","Party under the STARS","Make a Bot", "Movie Day"]
            let eventStart: [String?] = ["10/30/2019",nil,"11/23/2019","12/7/2019",nil,nil,nil,"1/30/2020",nil,"2/14/2020", "3/10/2020","3/28/2020",nil,"4/22/2020","5/5/2020","5/15/2020",nil,nil,nil,nil,nil,nil,nil,nil]
            let eventEnd: [String?] = ["11/30/2019",nil,"11/29/2019","12/10/2019",nil,nil,"1/15/2020",nil,nil,"2/17/2020", nil,nil,"4/10/2020","4/24/2020",nil,"5/16/2020",nil,nil,nil,nil,nil,nil,nil,nil]
            
            let rankNames: [String] = ["Cool Guy","Moss Lopez","Mike forgo","Noah Ortega","Carlos ortega","Hector Hernandez","Justin Bieber","Justin Timberlake","Nikki Mono", "Nancy Grace", "Coolman Global","Sexy Panther", "Ruby Lopez","Python Aston","Party Patter","Susie Vega", "Movie Day"]
            let donorNames: [String] = rankNames.reversed()
            
            data.resetType(Survey.self)
            data.resetType(Question.self)
            
            let exampleSurvey = data.createSurvey()
            data.createQuestion(name: "Does this work?", answers: ["No","Yes"], survey: exampleSurvey)
            data.createQuestion(name: "Do you like popups?", answers: ["maybe","perhaps"], survey: exampleSurvey)
            data.createQuestion(name: "Robots?", answers: ["sure!"], survey: exampleSurvey)
            
            let minLength = min(eventTitles.count, eventStart.count)
            data.resetType(Event.self)
            for i in 0..<minLength {
                data.createEvent(title: eventTitles[i], start: getDateFromText(date:eventStart[i]), end: getDateFromText(date:eventEnd[i]))
            }
            data.resetType(LeaderBoard.self)
            for (index, name) in rankNames.enumerated() {
                data.createLeaderBoardEntry(name: name, school: "Sunset", rank: Int16(index+1))
            }
            data.resetType(PastDonor.self)
            for (index, name) in donorNames.enumerated() {
                data.createPastDonor(name:name, date: Date() as NSDate, amount: Float((index % 5) * 10 + index + 1))
            }
            data.saveContext()
        }
        
    }
    
    
    
    
    
}
