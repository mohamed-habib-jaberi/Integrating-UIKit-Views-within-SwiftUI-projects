//
//  PetCareView.swift
//  SwiftUISocialMediaApp_UIKit&SwiftUI
//
//  Created by mohamed  habib on 04/06/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI

struct PetCareView: View {
    
    @EnvironmentObject var petModel: PetPreferences
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            
            if verticalSizeClass == .regular {
                
                VStack {
                    VStack(alignment: .center) {
                        PetProfileImage(humanPet: petModel.selectedPet)
                        
                        Text(petModel.selectedPet.name)
                            .font(Font.system(size: 32, design: .rounded))
                            .foregroundColor(.myGreen)
                    }
                    
                    PetBioRow(hobbyText: petModel.selectedPet.favoriteHobby)
                    
                    PetCareRow(petModel: petModel.selectedPet)
                }
                .navigationBarTitle(Text(verbatim: "Pet Care"), displayMode: .inline)
                .navigationBarItems(
                        trailing: Button(action: {
                          self.isPresented.toggle()
                        }, label: {
                          Text(verbatim: "Mouse Alert!")
                        })
                    )
                
            }else{
              VStack {
                VStack(alignment: .center) {
                  PetProfileImage(humanPet: petModel.selectedPet)
                  
                  Text(petModel.selectedPet.name)
                    .font(Font.system(size: 32, design: .rounded))
                    .foregroundColor(.myGreen)
                }
                
                PetBioRow(hobbyText: petModel.selectedPet.favoriteHobby)
                
                PetCareRow(petModel: petModel.selectedPet)
              }
              .navigationBarTitle(Text(verbatim: "Pet Care"), displayMode: .inline)
                .navigationBarItems(
                  trailing: Button(action: {
                    self.isPresented.toggle()
                  }, label: {
                    Text(verbatim: "Mouse Alert!")
                  })
              )
            }
        }
        .sheet(isPresented: self.$isPresented, content: {
           MouseAlertView()
           })
    }
}
struct PetCareView_Previews: PreviewProvider {
    static var previews: some View {
        PetCareView()
    }
}
