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
  var mouseSpotting: MouseLocation

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: .zero)
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<LocationMap>) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: mouseSpotting.coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
    }
}
