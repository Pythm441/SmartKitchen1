//
//  BreakFastView.swift
//  SmartKitchen
//
//  Created by Hesham Fakoush on 13/09/2023.
//

import SwiftUI
import Foundation

struct BreakFastView: View {
    @StateObject var apiModel = ApiModel()
    @State private var searchText: String = ""
    var body: some View {
        NavigationView{
            List(apiModel.api2, id: \.id) { food in
                Text(food.title)
                
            }
            
                .listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { value in
                    Task.init {
                        if !value .isEmpty && value.count > 3 {
                            await apiModel.search(name: "Milk")
                            print(value)
                           try await print(Webservice().getFood(searchTerm: "Water"))
                        } else {
                            apiModel.api2.removeAll()
                        }
                    }
                }
                .navigationTitle("BreakFast")
        }
    }
    
    struct BreakFastView_Previews: PreviewProvider {
        static var previews: some View {
            BreakFastView()
        }
    }
}
