//
//  Data.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/28/20.
//

import SwiftUI

struct Test: Codable, Identifiable {
    let id = UUID()
    
    var image: String?
    
    var name: String
    var upc: String?
    
    var category: String?
    var sku: String
    
    var size: String?
    var pack_count: Int

}

class API {
    func getTests(completion: @escaping ([Test]) -> ()) {
        //        guard let url = URL(string: "https://www.biolabhydra.com/api/v3/water_tests") else {return}
        guard let url = URL(string: "https://www.biolabhydra.com/api/v3/products") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let test = try! JSONDecoder().decode([Test].self, from: data!)
            
            DispatchQueue.main.async{
                completion(test)
            }
        }
        .resume()
    }
}
