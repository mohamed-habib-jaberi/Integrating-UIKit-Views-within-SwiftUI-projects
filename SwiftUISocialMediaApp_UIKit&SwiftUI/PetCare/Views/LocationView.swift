//
//  LocationView.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 08/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI

struct LocationView : View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var mouseLocation: MouseLocation
  
  var body: some View {
    
    VStack {
      LocationMap(mouseSpotting: mouseLocation)
        .mask(Image("Mouse Watch")
          .resizable()
          .aspectRatio(contentMode:. fit))
          .shadow(radius: 10)
          .padding()
      
      Text(verbatim: "🐭 \(mouseLocation.description) 🐭")
        .font(Font.system(.title, design: .rounded))
        .lineLimit(nil)
      
      Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }) {
        Text(verbatim: "Assign to me")
          .foregroundColor(.white)
          .fontWeight(.bold)
          .frame(minWidth: 0, maxWidth: .infinity)
          .padding()
          .background(Color.red)
          .cornerRadius(20)
          .padding()
      }
      
      Spacer()
    }
    .background(Color.myGreen)
    .navigationBarTitle(Text(mouseLocation.description), displayMode: .inline)
  }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
      LocationView(mouseLocation: MouseLocation.demoData.randomElement()!)
    }
}
