//
//  MouseLocation.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 08/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI
import MapKit

struct MouseLocation: Hashable, Identifiable {
  
  static func == (lhs: MouseLocation, rhs: MouseLocation) -> Bool {
    return lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(coordinate.latitude)
    hasher.combine(coordinate.longitude)
  }
  
  var id: Int
  var description: String
  var coordinate: CLLocationCoordinate2D
}

extension MouseLocation {
  static var demoData: [MouseLocation] = [
    MouseLocation(
      id: 0,
      description: "Location of Mouse Genesis found at Cupertino!",
      coordinate: CLLocationCoordinate2D(latitude: 36.778259, longitude: -119.417931)),
    MouseLocation(
      id: 1,
      description: "Spotted something from London Eye",
      coordinate: CLLocationCoordinate2D(latitude: 51.5033, longitude: 0.1195)),
    MouseLocation(
      id: 2,
      description: "Une souris a la Paris!",
      coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude:2.3522)),
    MouseLocation(
      id: 3,
      description: "A moose is loose in Scotland!",
      coordinate: CLLocationCoordinate2D(latitude: 55.953251, longitude: -3.188267)),
    MouseLocation(
      id: 4,
      description: "A little bligher spotted down under!",
      coordinate: CLLocationCoordinate2D(latitude: -33.865143, longitude: 151.2093)),
    MouseLocation(
      id: 5,
      description: "Something sneaky in streets of Rome.",
      coordinate: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964))
  ]
}

