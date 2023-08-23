//
//  RecipeModel.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published private(set) var myResult: [myResults] = []
    
    init() {
    
    func fetch() {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=3dcc7436a1dd43e1a71b267740fafacc") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let myResult = try JSONDecoder().decode([myResults].self , from: data)
                DispatchQueue.main.async {
                    self?.myResult = myResult
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
}


struct myResults: Hashable, Codable {
    let id : UInt
    let title : String
    let image : String
    let imageType : String
    let number : Int
}
