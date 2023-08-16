//
//  OnboardingScreen.swift
//  dark-sky-app
//
//  Created by Ananya Nagireddy on 8/11/23.
//

import SwiftUI
import CoreLocationUI

struct OnboardingScreen: View {
    //locationManager is a shared data object that we retrieve from the environment 
    @EnvironmentObject var locationManager
    :LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 10){
                Text("Hi there!").bold().font(.title)
                
                Text("Please share your current location to retrieve stargazing weather in your area.").padding()
                
            }.multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.foregroundColor(.white).cornerRadius(20)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
