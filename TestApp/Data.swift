//
//  Data.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/28/20.
//

import SwiftUI

struct Product: Codable, Identifiable {
    let id = UUID()
    var brand: String
    var image: String?
    
    var name: String
    var upc: String?
    
    var category: String?
    var sku: String
    
    var size: String?
    var pack_count: Int
}

struct Results: Codable, Identifiable {
    let id = UUID()
    var brand: String
    var image: String?
    
    var name: String
    var upc: String?
    
    var category: String?
    var sku: String
    
    var size: String?
    var pack_count: Int
}

class API {
    func getResults(completion: @escaping ([Results]) -> ()) {
        
        guard let url = URL(string: "https://www.biolabhydra.com/api/v3/water_tests") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let results = try! JSONDecoder().decode([Results].self, from: data!)
            
            DispatchQueue.main.async{
                completion(results)
            }
        }
        .resume()
    }
    
    func getProducts(completion: @escaping ([Product]) -> ()) {
        guard let url = URL(string: "https://www.biolabhydra.com/api/v3/products") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let product = try! JSONDecoder().decode([Product].self, from: data!)
            
            DispatchQueue.main.async{
                completion(product)
            }
        }
        .resume()
    }
}
