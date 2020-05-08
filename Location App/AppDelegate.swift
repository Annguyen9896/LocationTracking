//
//  AppDelegate.swift
//  Location App
//
//  Created by An Nguyen on 1/27/20.
//  Copyright © 2020 An Nguyen. All rights reserved.
//

import UIKit
import EstimoteProximitySDK
import UserNotifications
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var proximityObserver: ProximityObserver!
    let beaconManager = ESTBeaconManager()

    
//    let beacons = [
//           "5890:28757",  //coconut
//           "40617:19064", //ice
//           "30415:35981", //mint
//           "12877:32711"  //blueberry
//       ]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        //ask for notification
//        let center = UNUserNotificationCenter.current()
//
//        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
//
//        }
//
//        //ask for tracking user location
//        locationManager.requestAlwaysAuthorization()
        
      
        //TODO: get notification from API.

//        let content = UNMutableNotificationContent()
//        content.title = "Hey! How you doing?"
//        content.body = ":3"
        
//        Configure the recurring date.
//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
//
//        dateComponents.weekday = 8 // Tuesday
//        dateComponents.hour = 19    // 14:00 hours
//        dateComponents.minute = 18
//
//        // Create the trigger as a repeating event.
//        let trigger = UNCalendarNotificationTrigger(
//                 dateMatching: dateComponents, repeats: true)

        
//        //Create the request
//        let uuidString = UUID().uuidString
//
//        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
//
//        //Register with notification center
//
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.add(request) { (error) in
//           if error != nil {
//              // Handle any errors.
//           }
//        }
        
        
//        //iBeacon
//        self.beaconManager.delegate = self
//        self.beaconManager.requestAlwaysAuthorization()
//
//        //monitoring ice
//        self.beaconManager.startMonitoring(for: CLBeaconRegion(
//        proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
//        major: 5890, minor: 28757, identifier: "monitored region"))
        
//        //Send to API
//        func beaconManager(_ manager: Any, didEnter region: CLBeaconRegion) {
//            let location = Location(username: "An Nguyen", lat: -1, long: -1, uuid: <#UUID#>, , major: Int?, minor: <#T##Int?#>, accuracy: <#T##Double?#>, proximity: <#T##Int?#>)
//        }
        
//        //proximity beacon
//        let cloudCredentials = CloudCredentials(appID: "location-base-app-4fk", appToken: "58c1fd068970c300814b833bce44f811")
//        self.proximityObserver = ProximityObserver(
//            credentials: cloudCredentials,
//            onError: { error in
//                print("proximity observer error: \(error)")
//        })
//
//        let zone = ProximityZone(tag: "room", range: .near)
//        zone.onEnter = { context in
//            let roomName = context.attachments["room-name"]
//            print("Welcome to \(String(describing: roomName)) room")
//        }
//        zone.onExit = { _ in
//            print("Bye bye!")
//        }
//        zone.onContextChange = { contexts in
//            let deskOwners: [String] = contexts.map { context in
//                return context.attachments["room-name"]!
//            }
//            print("In range of room: \(deskOwners)")
//        }
        

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }


}

