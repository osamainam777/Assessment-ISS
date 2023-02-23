//
//  MapView+Extension.swift
//  AssessmentApple
//
//  Created by Usama Inaam Rasheed on 2/22/23.
//

import Foundation
import MapKit


extension MKMapView {
    
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 10000
    
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
   
    func setPinUsingMKPlacemark(location: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Here"
        let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        self.setRegion(coordinateRegion, animated: true)
        self.addAnnotation(annotation)
    }
}
