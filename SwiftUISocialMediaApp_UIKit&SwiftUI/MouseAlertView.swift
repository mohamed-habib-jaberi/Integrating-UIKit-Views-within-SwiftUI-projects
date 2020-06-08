//
//  MouseAlertView.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 08/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI

struct MouseAlertView: View {
    
    @State private var locations = MouseLocation.demoData
    
    var body: some View {
        NavigationView{
            List{
                ForEach(locations) { location in
                    NavigationLink(destination: LocationView(mouseLocation: location)) {
                        Text("\(location.description)")
                            .font(.body)
                        
                    }
                }
            .onDelete(perform: removeLocation)
            }
        }
    }
    
    func removeLocation(at offset: IndexSet) {
        if let first = offset.first {
            locations.remove(at: first)
        }
    }
}

struct MouseAlertView_Previews: PreviewProvider {
    static var previews: some View {
        MouseAlertView()
    }
}
