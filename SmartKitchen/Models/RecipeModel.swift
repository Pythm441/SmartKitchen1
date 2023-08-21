//
//  RecipeModel.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

import Foundation

 



struct Response: Codable {
    let results: myResults
    let offset: Int
    let number: Int
    let totalResults: Int

}

struct myResults: Codable {
    let id : Int
    let title : String
    let image : String
    let imageType : String
}
