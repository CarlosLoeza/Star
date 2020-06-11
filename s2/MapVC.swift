//
//  MapVC.swift
//  s2
//
//  Created by Carlos Loeza on 6/9/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import UIKit
import MapKit // Map functions
import CoreLocation



class MapVC: UIViewController, MKMapViewDelegate {
    // Map on our viewcontroller
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        // Set initial location in Los Angeles
        let initialLocation = CLLocation(latitude: 34.0522, longitude: -118.2437)
        // Helper method to help us zoom in on our location
        mapView.centerToLocation(initialLocation)
    
        
        // This will limit the amount a person can zoom out
        let losAngeles = CLLocation(latitude: 34.0522, longitude: -118.2437)
           let region = MKCoordinateRegion(
             center: losAngeles.coordinate,
             latitudinalMeters: 35000,
             longitudinalMeters: 25000)
        mapView.setRegion(region, animated: true)
           //mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region),animated: true)
           
       
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 400000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        //  delegate of the map view
        mapView.delegate = self
        
        // Show artwork on map
        let artwork = Artwork(
          title: "Griffith Park Observatory",
          locationName: "",
          discipline: "Observatory",
          coordinate: CLLocationCoordinate2D(latitude: 34.133334, longitude: -118.283346))
        mapView.addAnnotation(artwork)
        
        
        
        // LA Museum
        let LACountyMuseum = MKPointAnnotation()
        LACountyMuseum.coordinate = CLLocationCoordinate2D(latitude: 34.064413, longitude: -118.359219)
        LACountyMuseum.title = "Los Angeles County Museum"
        mapView.addAnnotation(LACountyMuseum)
        
        let supreme = MKPointAnnotation()
        supreme.coordinate = CLLocationCoordinate2D(latitude: 34.080080, longitude: -118.361675)
        supreme.title = "Supreme"
        supreme.subtitle = "Lebron James"
        mapView.addAnnotation(supreme)
        
        
        let catchLA = MKPointAnnotation()
        catchLA.coordinate = CLLocationCoordinate2D(latitude: 34.081627, longitude: -118.383690)
        catchLA.title = "Catch LA"
        catchLA.subtitle = "Kylie Jenner"
        mapView.addAnnotation(catchLA)
        
        
        let delilah = MKPointAnnotation()
        delilah.coordinate = CLLocationCoordinate2D(latitude: 34.091243, longitude: -118.363592)
        delilah.title = "Delilah"
        delilah.subtitle = "Steph Curry"
        mapView.addAnnotation(delilah)

//
//        let  = MKPointAnnotation()
//               .coordinate = CLLocationCoordinate2D(latitude: 34.080080, longitude: -118.361675)
//                   .title = ""
//                       .mapView.addAnnotation()
//
//
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


// This will allows us to display the correct zoom level when we
// zone in on LA
// location: LA
// regionRadius: .5 miles
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 25000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

//
extension ViewController: MKMapViewDelegate {
  // 1 gets called for every annotation you add to the map
  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    // 2
    guard let annotation = annotation as? Artwork else {
      return nil
    }
    // 3
    let identifier = "artwork"
    var view: MKMarkerAnnotationView
    // 4
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      // 5
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
    
    
    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
      guard let artwork = view.annotation as? Artwork else {
        return
      }

      let launchOptions = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
      ]
      artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
}
