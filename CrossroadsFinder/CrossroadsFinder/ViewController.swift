//
//  ViewController.swift
//  CrossroadsFinder
//
//  Created by Dani Lubezki on 3/23/20.
//  Copyright © 2020 Dani Lubezki. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    let CROSSROADS_LAT = 34.0340892
    let CROSSROADS_LONG = -118.4747321
    let CC_LAT = 34.0573
    let CC_LONG = 118.4177
    let A_LAT = 34.0407
    let A_LONG = 118.4279
    
    @IBOutlet weak var crossroadsLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var centuryLabel: UILabel!
    @IBOutlet weak var Mapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Mapview.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2DMake(CROSSROADS_LAT, CROSSROADS_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        Mapview.setRegion(MKCoordinateRegion(rect), animated: true)
        let centuryPoint = MKMapPoint(CLLocationCoordinate2DMake(CC_LAT, CC_LONG))
        let applePoint = MKMapPoint(CLLocationCoordinate2DMake(A_LAT, A_LONG))
    }

    @IBAction func zoomIn(_ sender: Any) {
        let factor = 0.5
        zoom(factor)
    }
    
    @IBAction func zoomOut(_ sender: Any) {
        let factor = 2.0
        zoom(factor)
    }
    func zoom(_ zoomFactor: Double) {
        let region = Mapview.region
        let span = region.span
        let newLat = span.latitudeDelta * zoomFactor
        let newLong = span.longitudeDelta * zoomFactor
        let newSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newSpan)
        Mapview.setRegion(newRegion, animated: true)
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = Mapview.visibleMapRect
        let appleLoc = CLLocationCoordinate2DMake(A_LAT, A_LONG)
               let applePoint = MKMapPoint(appleLoc)
               if rect.contains(applePoint) {
                   homeLabel.text = "hey, there's apple pan" }
                   else { homeLabel.text = "where is apple pan?"
        let centuryLoc = CLLocationCoordinate2DMake(CC_LAT, CC_LONG)
        let centuryPoint = MKMapPoint(centuryLoc)
        if rect.contains(centuryPoint) {
            centuryLabel.text = "hey, there's century city" }
            else { centuryLabel.text = "where is century city?"
        let crossroadsLoc = CLLocationCoordinate2DMake(CROSSROADS_LAT, CROSSROADS_LONG)
        let crossroadsPoint = MKMapPoint(crossroadsLoc)
        if rect.contains(crossroadsPoint) {
            crossroadsLabel.text = "hey, there's crossroads" }
            else { crossroadsLabel.text = "where is crossroads?"
        }
    }

}
}
}
