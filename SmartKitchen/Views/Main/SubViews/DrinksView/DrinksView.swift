//
//  DrinksView.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 12/09/2023.
//

import SwiftUI

struct DrinksView: View {
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    NavigationLink(destination: ColdDView()) {
                        Image("ColdD.i")
                    }
                    Text("Cold drinks")
                        .font(.system(.title3))
                }
                .padding()
                
                VStack {
                    NavigationLink(destination: HotDView()) {
                        Image("HotD.i")
                    }
                    Text("Hot drinks")
                        .font(.system(.title3))
                }
                .padding()
                
                .padding()
            }
            .navigationTitle("Drinks")
            
            .font(.system(.largeTitle))
            .foregroundColor(.black)
        }
    }
    struct DrinksView_Previews: PreviewProvider {
        static var previews: some View {
            DrinksView()
        }
    }
}
