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
            let item: [String] = ["FIU Mobile Robotics Social","Mentor Weekend at FIU","Swift Workshop","Mobile Robotics Workshop","Girls Who Code Event","Make a Plane","Educational Lectures Online","JAVA Workshop","Capture the Flag", "Java Practice Code", "Hackathon","FIU Panther Night", "Ruby Code Workshop","Python Workshop","Party under the STARS","Make a Bot", "Movie Day"]
            
            let _: [String] = ["10/20/19","10/30/19","11/15/19","11/29/19","12/7/19","","","1/15/2020","1/30/2020","","2/14/2020", "3/10/2020","3/28/2020","4/10/2020","4/22/2020","5/5/2020","5/15/2020"]
            data.resetType(Event.self)
            for x in 0..<item.count {
                data.createEvent(title: item[x])
            }
        }
        
    }
    
    
    
    
    
}
