//
//  PageView.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 08/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
  
    var viewControllers: [UIHostingController<Page>]
    
    @State private var currentPage = 0
    
    init(_ views: [Page] ) {
        self.viewControllers = views.map{ UIHostingController(rootView: $0)}
    }
    
  var body: some View {
    ZStack{
        PageViewController(controllers: viewControllers, currentPage: $currentPage)
    }
  }
}
