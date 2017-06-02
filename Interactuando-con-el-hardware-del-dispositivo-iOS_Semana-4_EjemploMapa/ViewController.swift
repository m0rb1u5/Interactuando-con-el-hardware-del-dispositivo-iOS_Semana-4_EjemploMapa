//
//  ViewController.swift
//  Interactuando-con-el-hardware-del-dispositivo-iOS_Semana-4_EjemploMapa
//
//  Created by Juan Carlos Carbajal Ipenza on 2/06/17.
//  Copyright © 2017 Juan Carlos Carbajal Ipenza. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapa: MKMapView!

    private let manejador = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.manejador.delegate = self
        self.manejador.desiredAccuracy = kCLLocationAccuracyBest
        self.manejador.requestWhenInUseAuthorization()
        
        var punto = CLLocationCoordinate2D()
        punto.latitude = 19.52748
        punto.longitude = -96.92315
        let pin = MKPointAnnotation()
        pin.title = "Xalapa"
        pin.subtitle = "Veracruz"
        pin.coordinate = punto
        mapa.addAnnotation(pin)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.manejador.startUpdatingLocation()
            self.mapa.showsUserLocation = true
        }
        else {
            self.manejador.stopUpdatingLocation()
            self.mapa.showsUserLocation = false
        }
    }
}

