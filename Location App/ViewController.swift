//
//  ViewController.swift
//  Location App
//
//  Created by An Nguyen on 1/27/20.
//  Copyright © 2020 An Nguyen. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications

class ViewController: UIViewController, CLLocationManagerDelegate, ESTBeaconManagerDelegate {
    
    //Data for estimote beacons
    let beacons = [
        "5890:28757",  //coconut
        "40617:19064", //ice
        "30415:35981", //mint
        "12877:32711"  //blueberry
    ]
    
    let username = "an"
        
    @IBOutlet weak var distanceReading: UILabel!
    
    @IBOutlet weak var details: UILabel!
    
    //beacon "ice" manager and region
           let beaconManager = ESTBeaconManager()
           let beaconRegion = CLBeaconRegion(
               proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
               identifier: "ranged region")
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
        
        //request using location
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.allowsBackgroundLocationUpdates = true
        }
        
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeacons(in: self.beaconRegion)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeacons(in: self.beaconRegion)
    }
    

    func beaconManager(_ manager: Any, didRangeBeacons beacons: [CLBeacon],
                       in region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first {
            // TODO: update the UI here
            let location = Location(username: username, lat: -1, lon: -1, uuid: "B9407F30-F5F8-466E-AFF9-25556B57FE6D", major: nearestBeacon.major as? Int, minor: nearestBeacon.minor as? Int,range: nearestBeacon.proximity.rawValue)

            let postRequest = SendLiveLocation(endpoint: "livelocation")

            postRequest.summit(location, completion: {Result in
                switch Result{
                case .success( _):
                        switch nearestBeacon.major {
                        case 5890:
                            self.distanceReading.text = "You are in study room."
                        case 40617:
                            self.distanceReading.text = "You are in bed room."
                        case 30415:
                            self.distanceReading.text = "You are in living room"
                        case 12877:
                            self.distanceReading.text = "You are in the kitchen"
                        default:
                            self.distanceReading.text = "No beacon near by"
                        }

                    case .failure(let error):
                        print("An error has occured \(error)")
                    }
            })

        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let nearestLocation = locations.first{
            let location = Location(username: username, lat: nearestLocation.coordinate.latitude, lon: nearestLocation.coordinate.longitude, uuid: "-1", major: -1, minor: -1,range: -1)
            self.distanceReading.text = "You are at this coordinate: "
            self.details.text="Latitute:\(location.lat!) Longtitute:\(location.lon!)"
        }
    }
    //TODO: Manage location in the background
//    func beaconManager(_ manager: Any, didStartMonitoringFor region: CLBeaconRegion) {
//        if let nearestBeacon =  beacons.first{
//            print(nearestBeacon)
//        }
//    }

   
}



