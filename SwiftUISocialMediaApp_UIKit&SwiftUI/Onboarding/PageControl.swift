//
//  PageControl.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 08/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {

    var pageCount: Int
    
    class PageCoordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(_ sender: UIPageControl){
            control.currentPage = sender.currentPage
        }
    }
    
    @Binding var currentPage: Int
    
 func makeUIView(context: Context) -> UIPageControl {
   let pageControl = UIPageControl()
    pageControl.numberOfPages = pageCount
    pageControl.addTarget(context.coordinator, action: #selector(PageCoordinator.updateCurrentPage), for: .valueChanged)
    return pageControl
  }

  func updateUIView(_ uiView: UIPageControl, context: Context) {

    uiView.currentPage = currentPage
  }
    
    func makeCoordinator() -> PageCoordinator {
        PageCoordinator(self)
    }
}
