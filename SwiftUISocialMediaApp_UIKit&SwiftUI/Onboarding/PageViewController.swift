//
//  PageViewController.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 08/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit


class PageViewController: UIPageViewController {
  
  var controllers: [UIViewController] = []
  
  var currentPage: Int = 0
  
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerBefore viewController: UIViewController
  ) -> UIViewController? {
    guard let index = controllers.firstIndex(of: viewController) else {
      return nil
    }
    guard index != 0 else {
      return nil
    }
    return controllers[index - 1]
  }
  
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerAfter viewController: UIViewController
  ) -> UIViewController? {
    guard let index = controllers.firstIndex(of: viewController) else {
      return nil
    }
    guard index + 1 < controllers.count else { return nil }
    
    return controllers[index + 1]
  }
  
  func pageViewController(
    _ pageViewController: UIPageViewController,
    didFinishAnimating finished: Bool,
    previousViewControllers: [UIViewController],
    transitionCompleted completed: Bool
  ) {
    
    if completed,
      let visibleViewController = pageViewController.viewControllers?.first,
      let index = controllers.firstIndex(of: visibleViewController) {
      currentPage = index
    }
  }
  
}

