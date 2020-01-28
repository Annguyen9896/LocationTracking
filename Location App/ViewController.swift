//
//  ViewController.swift
//  Location App
//
//  Created by An Nguyen on 1/27/20.
//  Copyright © 2020 An Nguyen. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()

//        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
}
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            print(location.coordinate)
        }
}
        // Do any additional setup after loading the view.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisablePopUp()
        }
}
    func showLocationDisablePopUp(){
        let alertController = UIAlertController(title: "Backgroud location access denied", message: "Inorder to send notification, we need your location", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        
        let openAction = UIAlertAction(title: "Open Setting", style: .default) {(action) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

