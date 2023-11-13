//
//  Splash.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 26/08/2023.
//

import SwiftUI

struct Splash: View {
    @State private var showImage = true
    @State private var showContentView = false
    static var showImage = true
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                if showImage {
                    Image("MyLogo")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(showImage ? 1.5 : 1.0)
                        .transition(.scale)
                        .opacity(showImage ? 1.0 : 0.0)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation {
                                    showImage = false
                                   
                                }
                                
                            }
                            
                        }
                    
                }
                if showImage == false {
                    ContentView()
                    
                }
                
            }
            
        }
    }
}

class AppViewModel: ObservableObject {
    @Published var showSplash = true
}
