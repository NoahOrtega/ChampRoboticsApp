//
//  locationManager.swift
//  Champ Robotics App
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

import UIKit
import CoreLocation
import MapKit

class LocationController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    let model = ChampsModel.sharedInstance
    
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initialize location manager and map view
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        eventLocation = CLLocation(latitude: 25.760590, longitude: -80.375450)
    }
    
    //TODO: upgrade to xcode 11 to fix crash
    //https://stackoverflow.com/questions/43501494/libmobilegestalt-mobilegestaltsupport-m153-pid-1668-does-not-have-sandbox-acce/44553100#44553100
    var eventLocation:CLLocation?
    func addressToCoord(addressString: String) {
        //convert address to coordinate
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                    self.eventLocation  = location
                } else {
                    print("address matched no locations")
                }
            } else {
                print("couldnt convert address to location")
            }
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
        print("stopping location tracking")
    }
    
    //if changed authorization
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse){
            if CLLocationManager.isRangingAvailable() {
                //decide map frame location
                let region = MKCoordinateRegion(center: eventLocation!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                mapView.setRegion(region, animated: true)

                // Drop a pin at event location
                let myAnnotation: MKPointAnnotation = MKPointAnnotation()
                myAnnotation.coordinate = eventLocation!.coordinate
                myAnnotation.title = "Event Location"
                mapView.addAnnotation(myAnnotation)

                //render a circle around the pin
                let circle = MKCircle(center: eventLocation!.coordinate, radius: 400)
                mapView.add(circle)

                locationManager.startUpdatingLocation()
                print("starting location tracking")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last {
            let distance = eventLocation?.distance(from: currentLocation)
            if(distance! < 400.0) {
                checkInButton.isEnabled = true
                rangeLabel.text = "Within range to check in!"
            }
            else {
                checkInButton.isEnabled = false
                rangeLabel.text = "You are not within range to check in"
            }
        }
    }
    
    @IBAction func checkInPressed(_ sender: Any) {
        model.userCheckIn()
        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    //properties of the rendered circle
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let circelOverLay = overlay as? MKCircle else {return MKOverlayRenderer()}
    
        let circleRenderer = MKCircleRenderer(circle: circelOverLay)
        //https://developer.apple.com/documentation/quartzcore/cashapelayer
        circleRenderer.strokeColor = .black
        circleRenderer.lineWidth = 1.0
        circleRenderer.fillColor = .red
        circleRenderer.alpha = 0.05
        return circleRenderer
    }
}
