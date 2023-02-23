//
//  ViewController.swift
//  AssessmentApple
//
//  Created by Usama Inaam Rasheed on 2/22/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
            self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { _ in
                self.setupViewController()
            })
    }
    
    func setupViewController() {
        let viewModel = LocationViewModel()
        viewModel.getData(onCompletionHandler: {lat,long in
            print("Location Updated")
            self.addPinLocation(lat: lat , long: long)
        })
    }
}

//MARK: - MapView

extension ViewController {
    
    func addPinLocation(lat: Double, long: Double) {
        let initialLocation = CLLocation(latitude: lat, longitude: long)
        self.mapView.centerToLocation(initialLocation)
        let cood = CLLocationCoordinate2DMake(lat, long)
        self.mapView.setPinUsingMKPlacemark(location: cood)
    }
}

