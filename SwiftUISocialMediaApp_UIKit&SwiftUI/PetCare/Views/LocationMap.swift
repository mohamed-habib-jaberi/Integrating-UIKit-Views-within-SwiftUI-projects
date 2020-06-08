//
//  LocationMap.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 08/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI
import MapKit

struct LocationMap: UIViewRepresentable {
    
    
    class LocationCoordinator: NSObject, MKMapViewDelegate {
        var mapView: LocationMap
        
        init(_ mapView: LocationMap) {
            self.mapView = mapView
        }
        
        func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
            print("Finish rendering Map! find the mice!")
        }
    }
    
    func makeCoordinator() -> LocationCoordinator {
        LocationCoordinator(self)
    }
    
  var mouseSpotting: MouseLocation

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: .zero)
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<LocationMap>) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: mouseSpotting.coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
    }
}
