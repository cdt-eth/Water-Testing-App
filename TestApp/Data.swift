//
//  Data.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/28/20.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

class API {
    func getTests(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
//        guard let url = URL(string: "https://www.biolabhydra.com/api/v3/water_tests") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            DispatchQueue.main.async{
                completion(posts)
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
