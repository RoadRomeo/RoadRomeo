//
//  ViewController.swift
//  HonoluluArt
//
//  Created by Naidu Shravan on 9/12/16.
//  Copyright © 2016 snaidu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
}

func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
  
    let location = locations.last
    
    let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
    
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    self.mapView.setRegion(region, animated: true)
    
    self.locationManager.stopUpdatingLocation()
    
}

func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
{
    print("Errors: " + error.localizedDescription)
}
}
