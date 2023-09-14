//
//  BreakFastView.swift
//  SmartKitchen
//
//  Created by Hesham Fakoush on 13/09/2023.
//

import SwiftUI

struct BreakFastView: View {
    @State private var API = ""
    var body: some View {
        
        VStack{
            Text("BreakFast")
                
        }
        .navigationTitle("Breakfast")
        .searchable(text: $API)
    }
    
    struct BreakFastView_Previews: PreviewProvider {
        static var previews: some View {
            BreakFastView()
        }
    }
}
