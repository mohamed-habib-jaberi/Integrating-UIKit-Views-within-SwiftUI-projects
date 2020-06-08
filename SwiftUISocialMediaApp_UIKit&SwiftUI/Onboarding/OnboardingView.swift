//
//  OnboardingView.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 08/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI

struct OnBoardingModel {
  var image: Image
  var title: Text
  var description: Text
}

struct OnboardingView : View {
  
  // We are using a simple, static model dependency here. As no mutations occur, the @State is not required
  var model: OnBoardingModel
  
  var body: some View {
    VStack(alignment: .center, spacing: 15) {
      model.image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(15)
        .padding()
      
      model.title
        .font(Font.system(size: 32, design: .rounded))
        .foregroundColor(.primary)
      
      model.description
        .font(.body)
        .foregroundColor(.secondary)
        .lineLimit(nil)
        .padding()
    }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      .padding()
      .background(Color.myGreen)
  }
}

struct OnboardingView_Previews : PreviewProvider {
  static var previews: some View {
    OnboardingView(
      model: OnBoardingModel(
        image: Image("News1"),
        title: Text(verbatim: "Preview"),
        description: Text(verbatim: "Content")))
  }
}
