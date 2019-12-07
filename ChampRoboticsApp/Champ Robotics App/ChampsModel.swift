//
//  ChampsModel.swift
//  DemoGroupProject
//
//  Created by Komasquin Lopez on 11/10/19.
//  Copyright © 2019 Komasquin Lopez. All rights reserved.
//

import Foundation

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
    
    //This is for the 20 or 40 most recent donors and to collect
    //info about any potentiol and actual donors.
    //MostRecentDonorsViewController <---------------------------------------------------Controller
    var donorsList: [donors] = []
    
    //This is for the ranking of students and for the individual
    //apps user information.
    //Can be modified to allow log-in later
    //studentRankViewController <--------------------------------------------------------Controller
    var studentsList: [student] = []
    
    //These variables are used to change the challenges for the
    //10% kicker.
    //ChallengeViewController <----------------------------------------------------------Controller
    var currentChallengeDescription: String!
    var currentChanllengeRules: String!
    
    //init arrays with a test and can change to admin later???
    init () {
        donorsList.append(contentsOf: [donors(donorFirstName: "testD", donorLastName: "testD", donorEmail: "testD", donationAmount: 0, donorAgreementPressed: false)])
        
        studentsList.append(contentsOf: [student(studentName: "testS", studentSchool: "testS", studentID: "testS", ytdDonations: 0, quarterlydonations: 0)])
    }
    
    func initDummyData(should: Bool) {
        
        if(should) {
            let eventTitles: [String] = ["FIU Mobile Robotics Social","Mentor Weekend at FIU","Swift Workshop","Mobile Robotics Workshop","Girls Who Code Event","Make a Plane","Educational Lectures Online","JAVA Workshop","Capture the Flag", "Java Practice Code", "Hackathon","FIU Panther Night", "Ruby Code Workshop","Python Workshop","Party under the STARS","Make a Bot", "Movie Day"]
            //let eventDates: [String] = ["10/20/19","10/30/19","11/15/19","11/29/19","12/7/19","","","1/15/2020","1/30/2020","","2/14/2020", "3/10/2020","3/28/2020","4/10/2020","4/22/2020","5/5/2020","5/15/2020"]
            
            let rankNames: [String] = ["Cool Guy","Moss Lopez","Mike forgo","Noah Ortega","Carlos ortega","Hector Hernandez","Justin Bieber","Justin Timberlake","Nikki Mono", "Nancy Grace", "Coolman Global","Sexy Panther", "Ruby Lopez","Python Aston","Party Patter","Susie Vega", "Movie Day"]
            
            let donorNames: [String] = ["Cool Guy","Moss Lopez","Mike forgo","Noah Ortega","Carlos ortega","Hector Hernandez","Justin Bieber","Justin Timberlake","Nikki Mono", "Nancy Grace", "Coolman Global","Sexy Panther", "Ruby Lopez","Python Aston","Party Patter","Susie Vega", "Movie Day"]
            
            
            data.resetType(Event.self)
            for title in eventTitles {
                data.createEvent(title: title)
            }
            data.resetType(LeaderBoard.self)
            for (index, name) in rankNames.enumerated() {
                data.createLeaderBoardEntry(name: name, school: "Sunset", rank: Int16(index+1))
            }
            data.resetType(PastDonor.self)
            for (index, name) in donorNames.reversed().enumerated() {
                data.createPastDonor(name:name, date: Date() as NSDate, amount: Float((index % 5) * 10 + index + 1))
            }
            data.saveContext()
        }
        
    }
    
    
    
    
    
}
