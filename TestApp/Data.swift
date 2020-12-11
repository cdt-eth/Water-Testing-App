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
    
    
    
    
    
    
//    func getTheData(completion: @escaping ([Product]) -> ()) {
//
//
//        let parameters = "{  \"pool_volume\": 10000,  \"readings\": [    {      \"analyte\": \"fc\",      \"value\": 1.6    },    {      \"analyte\": \"ph\",      \"value\": 7.3    }  ]}"
//        let postData = parameters.data(using: .utf8)
//        var request = URLRequest(url: URL(string: "https://www.biolabhydra.com/api/v3/water_tests")!,timeoutInterval: Double.infinity)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("Basic Y2hyaXN0aWFuLnR1cm5lckBiaW9sYWJpbmMuY29tfDg6RTNYZFlQbnVXZ2hiOTZk", forHTTPHeaderField: "Authorization")
//        request.addValue("csrftoken=J7rRhxMbgGc5ugfEj2EtwsDV8qo6ZsE7pCqm3N9hutujQs0JSaSbP8sz5sL762ML", forHTTPHeaderField: "Cookie")
//        request.httpMethod = "POST"
//        request.httpBody = postData
////        guard let url = URL(string: "https://www.biolabhydra.com/api/v3/products") else {return}
//
//        URLSession.shared.dataTask(with: request) { (data, _, _) in
//            let product = try! JSONDecoder().decode([Product].self, from: data!)
//            DispatchQueue.global(qos: .background).async{
//                //fetch data
//                completion(product)
//
//                DispatchQueue.main.async{
//                    // update UI
//                }
//            }
//        }
//        .resume()
//    }
//}
//
//
//func loadData() {
//    print("Fetch")
//    let semaphore = DispatchSemaphore (value: 0)
//    let parameters = "{  \"pool_volume\": 10000,  \"readings\": [    {      \"analyte\": \"fc\",      \"value\": 1.6    },    {      \"analyte\": \"ph\",      \"value\": 7.3    }  ]}"
//    let postData = parameters.data(using: .utf8)
//    var request = URLRequest(url: URL(string: "https://www.biolabhydra.com/api/v3/water_tests")!,timeoutInterval: Double.infinity)
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.addValue("Basic Y2hyaXN0aWFuLnR1cm5lckBiaW9sYWJpbmMuY29tfDg6RTNYZFlQbnVXZ2hiOTZk", forHTTPHeaderField: "Authorization")
//    request.addValue("csrftoken=J7rRhxMbgGc5ugfEj2EtwsDV8qo6ZsE7pCqm3N9hutujQs0JSaSbP8sz5sL762ML", forHTTPHeaderField: "Cookie")
//    request.httpMethod = "POST"
//    request.httpBody = postData
//
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data = data else {
//            print(String(describing: error))
//            return
//        }
////            let results = try! JSONDecoder().decode([Result].self, from: data!)
////            DispatchQueue.main.async{
////                completion(results)
////            }
//        print(String(data: data, encoding: .utf8)!)
//        semaphore.signal()
//    }.resume()
//    semaphore.wait()
//}



struct Data_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
