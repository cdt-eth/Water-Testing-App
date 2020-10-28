//
//  Data.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/28/20.
//

import SwiftUI

struct Test: Codable, Identifiable {
    let id = UUID()
    //    var title: String
    //    var body: String
    //    let id: Int
//    var sku: String
    var name: String
//    var title: String
//    var description: String
//    var upc: String
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

//struct Data: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct Data_Previews: PreviewProvider {
//    static var previews: some View {
//        Data()
//    }
//}
