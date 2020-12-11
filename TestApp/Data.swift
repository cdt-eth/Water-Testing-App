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

class API {
    
    // MARK: - Product Public API
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

struct Data_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
