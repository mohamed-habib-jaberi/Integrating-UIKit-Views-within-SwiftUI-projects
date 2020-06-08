//
//  MewsListView.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 31/05/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI

struct MewsListView: View {
    
    @State private var isPresented = false
    @State private var posts: [MewsPost] = MewsPost.demoPosts
    @State private var isFilteringLovedPosts: Bool = false
    
    var body: some View {
        NavigationView{
            List{
                
                Toggle(isOn: $isFilteringLovedPosts) {
                    Text(verbatim: "Show loved posts only")
                }
                
                ForEach(posts) { post in
                    if !self.isFilteringLovedPosts || post.reaction == .love {
                        MewsRow(post: post)
                    }
                    
                }
            }
            .navigationBarTitle(Text(verbatim: "Cat Mews"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Text(verbatim: "Tutorial")
                })
            )
        }
        .sheet(isPresented: self.$isPresented, content: {
            PageView(self.makeOnboardingViews())
        })
    }
}


extension MewsListView {
    func makeOnboardingViews() -> [OnboardingView] {
        
        return [
            OnboardingView(
                model: OnBoardingModel(
                    image: Image("Onboarding3"),
                    title: Text(verbatim: "Read the Cat 'Mews'"),
                    description: Text(verbatim: "All the latest neighbourhood Mews delivered strait to CatKit as part of the service! React, Like and Read!"))
            ), OnboardingView(
                model: OnBoardingModel(
                    image: Image("Onboarding2"),
                    title: Text(verbatim: "Browse the 'Cat-alogue'"),
                    description: Text(verbatim: "Fancy spending your human pet's hard-earned money? We've no shortage of kitty treats available for your perusal."))
            ), OnboardingView(
                model: OnBoardingModel(
                    image: Image("Onboarding1"),
                    title: Text(verbatim: "Monitor your human pet"),
                    description: Text(verbatim: "Monitor the health of your human pet. If they get out of line, request a replacement from Paw Enforcement."))
            )
        ]
    }
}
struct MewsListView_Previews: PreviewProvider {
    static var previews: some View {
        MewsListView()
    }
}
