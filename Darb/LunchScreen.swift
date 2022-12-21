//
//   SplashScreenView.swift
//  WOM2
//
//  Created by Shaden on 12/04/1444 AH.
//

import SwiftUI

struct _SplashScreenView: View {
    @Binding var shouldshowonboarding: Bool
    @State var isActive : Bool = true
      @State private var size = 0.6
      @State private var opacity = 0.5
    
    var body: some View {
//        if shouldshowonboarding{
//
//        }
        if shouldshowonboarding {
               onborarding()
//                .onAppear()
               } else {
                   VStack {
                       VStack {
                           Image("Image 5")
                               .font(.system(size: 250,weight: .semibold))
                               .foregroundColor(.red)
                           Text("الدرب")
                               .font(.system(size: 66,weight: .bold))
                               .foregroundColor(Color("dark blue"))
                   
                               .foregroundColor(.accentColor)
                               
                       }
                       .scaleEffect(size)
                       .opacity(opacity)
                       .onAppear {
                           withAnimation(.easeIn(duration: 1.2)) {
                               self.size = 0.4
                               self.opacity = 1.00
                           }
                       }
                   }
                   .onAppear {
                       DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                           withAnimation {
                               self.isActive = true
                           }
                       }
                   }
               }
        
        
    }
       
}

struct _SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        _SplashScreenView(shouldshowonboarding: .constant(true))
    }
}
