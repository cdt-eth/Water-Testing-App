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

//struct Result: Codable, Identifiable {
//    var id = UUID()
//
//    var recommendations: String?
//    var created_at: String
//    var pool_system_type: String
//    var pool_volume: Int
//}

  
class API {
//    func getResults(completion: @escaping ([Result]) -> ()) {
//
//
//        guard let url = URL(string: "https://www.biolabhydra.com/api/v3/water_tests") else {return}
////        guard let url = URL(string: "https://www.biolabhydra.com/api-auth/login/?next=/api/v3/water_tests") else {return}
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//
//            do{
//                let result = try! JSONDecoder().decode([Result].self, from: data!)
//                print(result)
//
//            DispatchQueue.main.async{
//                completion(result)
//            }}
//        }
//        .resume()
//    }

    let user = "christian.turner@biolabinc.com|8"
    let password = "E3XdYPnuWghb96d"

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
