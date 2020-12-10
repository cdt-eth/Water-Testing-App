//
//  WaterTestView.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/5/20.
//

import SwiftUI
import Foundation

struct Welcome: Decodable, Identifiable {
    var id: Int?
    //    var id = UUID()
    //    var recommendations: [Any?]?
    var readings: [Reading]?
    //    var issues: [Any?]?
    var include_maintenance_recommendations: Bool?
    //    var testMethod, lsi, scanURL, pool: NSNull?
    var pool_volume: Int?
    //    var poolFinish, poolExternalID, poolSystemType, poolProductSanitizer: NSNull?
    var created_at, updated_at: String?
}

// MARK: - Reading
struct Reading: Decodable {
    var analyte: String?
    var value: String?
    //    var initialValue: NSNull?
}


var results = Welcome()

struct WaterTestView: View {
    @State var sliderValue = 0.0
    var minimumValue = 0.0
    var maximumvalue = 100.0
    
    // Total Hardness
    @State var valueTH = 0.0
    var minTH = 0.0
    var maxTH = 1000.0
    
    // Total Chlorine
    @State var valueTC = 0.0
    var minTC = 0.0
    var maxTC = 20.0
    
    // Free Chlorine
    @State var valueFC = 0.0
    var minFC = 0.0
    var maxFC = 20.0
    
    // pH
    @State var valuePH = 1.0
    var minPH = 1.0
    var maxPH = 14.0
    
    // Total Alkalinity
    @State var valueTA = 0.0
    var minTA = 0.0
    var maxTA = 1000.0
    
    // Stabilizer (CYA)
    @State var valueST = 0.0
    var minST = 0.0
    var maxST = 1000.0
    
//    @State private var results = [Result]()
    
    @State var res = Welcome()
    var body: some View {

          VStack(alignment: .leading) {

            Text(res.created_at ?? "N/A")
                .font(.subheadline)
                .padding()
            }.onAppear(){
                fetchResults().getData {(res) in
                    self.res = res
                }
            }
        
    
        VStack(spacing: 0) {
        
        Text("Total Hardness").font(.footnote).bold()
        if valueTH < 40 || valueTH > 750 {
        Text("\(Int(valueTH))").font(.title).bold().foregroundColor(Color.red)
        } else  {
        Text("\(Int(valueTH))").font(.title).bold()
        }
        
        HStack {
        Text("\(Int(minTH))")
        
        Slider(value: $valueTH, in: minTH...maxTH)
        
        Text("\(Int(maxTH))")
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
//        }.onAppear(perform: loadData)
        }
        VStack(spacing: 0) {
        Text("Total Chlorine").font(.footnote).bold()
        
        if valueTC < 4 || valueTC > 15 {
        Text("\(Int(valueTC))").font(.title).bold().foregroundColor(Color.red)
        } else  {
        Text("\(Int(valueTC))").font(.title).bold()
        }
        
        HStack {
        Text("\(Int(minTC))")
        
        Slider(value: $valueTC, in: minTC...maxTC)
        
        
        
        Text("\(Int(maxTC))")
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        VStack(spacing: 0) {
        Text("Free Chlorine").font(.footnote).bold()
        
        if valueFC < 4 || valueFC > 15 {
        Text("\(Double(valueFC), specifier: "%.1f")").font(.title).bold().foregroundColor(Color.red)
        } else  {
        Text("\(Double(valueFC), specifier: "%.1f")").font(.title).bold()
        }
        
        HStack {
        Text("\(Int(minFC))")
        
        Slider(value: $valueFC, in: minFC...maxFC, step: 0.1)
        
        Text("\(Int(maxFC))")
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        VStack(spacing: 0) {
        Text("pH").font(.footnote).bold()
        
        if valuePH < 7.3 || valuePH > 8.0 {
        Text("\(Double(valuePH), specifier: "%.1f")").font(.title).bold().foregroundColor(Color.red)
        } else  {
        Text("\(Double(valuePH), specifier: "%.1f")").font(.title).bold()
        }
        
        HStack {
        Text("\(Int(minPH))")
        
        Slider(value: $valuePH, in: minPH...maxPH, step: 0.1)
        
        Text("\(Int(maxPH))")
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        VStack(spacing: 0) {
        
        Text("Total Alkalinity").font(.footnote).bold()
        
        if valueTA < 40 || valueTA > 750 {
        Text("\(Int(valueTA))").font(.title).bold().foregroundColor(Color.red)
        } else  {
        Text("\(Int(valueTA))").font(.title).bold()
        }
        
        HStack {
        Text("\(Int(minTA))")
        
        Slider(value: $valueTA, in: minTA...maxTA)
        
        Text("\(Int(maxTA))")
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        VStack(spacing: 0) {
        Text("Stabilizer (CYA)").font(.footnote).bold()
        
        if valueST < 40 || valueST > 750 {
        Text("\(Int(valueST))").font(.title).bold().foregroundColor(Color.red)
        } else  {
        Text("\(Int(valueST))").font(.title).bold()
        }
        
        HStack {
        Text("\(Int(minST))")
        
        Slider(value: $valueST, in: minST...maxST)
        
        Text("\(Int(maxST))")
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }  .navigationBarTitle(Text("Pool Water Test"), displayMode:.inline)
        
    }
    
}


class fetchResults{
    func getData(completion: @escaping (Welcome) -> ()){
        print("Fetch")
        
        let parameters = "{  \"pool_volume\": 10000,  \"readings\": [    {      \"analyte\": \"fc\",      \"value\": 1.6    },    {      \"analyte\": \"ph\",      \"value\": 7.3    }  ]}"
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: "https://www.biolabhydra.com/api/v3/water_tests")!,timeoutInterval: Double.infinity)
        request.addValue("Basic Y2hyaXN0aWFuLnR1cm5lckBiaW9sYWJpbmMuY29tfDg6RTNYZFlQbnVXZ2hiOTZk", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("csrftoken=J7rRhxMbgGc5ugfEj2EtwsDV8qo6ZsE7pCqm3N9hutujQs0JSaSbP8sz5sL762ML", forHTTPHeaderField: "Cookie")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            let resultList = try! JSONDecoder().decode(Welcome.self, from: data!)
            print(" ")
            print("ID: \(resultList.id ?? 111)")
            print("VOLUME: \(resultList.pool_volume ?? 111)")
            print("RECOMMENDATIONS: \(resultList.include_maintenance_recommendations ?? true)")
            print("CREATD AT: \(resultList.created_at ?? "N/A")")
            print("UPDATED AT: \(resultList.updated_at ?? "N/A")")
            print("READINGS: \(String(describing: resultList.readings))")
            print(" ")
            print("SUCCESS: Got data - \(data! )")
            
            DispatchQueue.main.async {
                completion(resultList)           // << here !!
            }
        }
        task.resume()
    }
    
}
    
    
//    func loadData() {
//        print("Fetch")
//        let semaphore = DispatchSemaphore (value: 0)
//        let parameters = "{\n\n  \"pool_volume\": 10000,\n\n  \"pool_product_sanitizer\": 652,\n\n  \"readings\": [\n\n    {\n\n      \"analyte\": \"fc\",\n\n      \"value\": 1.6\n\n    },\n\n    {\n\n      \"analyte\": \"ph\",\n\n      \"value\": 8.6\n\n    }\n\n  ],\n\n  \"include_maintenance_recommendations\": true\n\n}"
//        let postData = parameters.data(using: .utf8)
//
//        var request = URLRequest(url: URL(string: "https://www.biolabhydra.com/api/v3/water_tests")!,timeoutInterval: Double.infinity)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("Basic Y2hyaXN0aWFuLnR1cm5lckBiaW9sYWJpbmMuY29tfDg6RTNYZFlQbnVXZ2hiOTZk", forHTTPHeaderField: "Authorization")
//        request.addValue("csrftoken=J7rRhxMbgGc5ugfEj2EtwsDV8qo6ZsE7pCqm3N9hutujQs0JSaSbP8sz5sL762ML", forHTTPHeaderField: "Cookie")
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//                return
//            }
////            let results = try! JSONDecoder().decode([Result].self, from: data!)
////            DispatchQueue.main.async{
////                completion(results)
////            }
//            print(String(data: data, encoding: .utf8)!)
//            semaphore.signal()
//        }.resume()
//        semaphore.wait()
//    }

    //    -------  -------  -------  -------  -------  -------  -------  --------------
//    func getProducts(completion: @escaping ([Product]) -> ()) {
//        guard let url = URL(string: "https://www.biolabhydra.com/api/v3/products") else {return}
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let product = try! JSONDecoder().decode([Product].self, from: data!)
//            DispatchQueue.main.async{
//                completion(product)
//            }
//        }
//        .resume()
//    }
//    -------  -------  -------  -------  -------  -------  -------  --------------
    //        var body: some View {
    //            Text("hi")
    //
    //            List(results){ result in
    //
    //                VStack(alignment: .leading){
    //    //                Text(result.recommendations ?? "N/A").font(.callout).italic()
    //    //                Text(result.created_at).font(.callout).italic()
    //    //                Text(result.pool_system_type).font(.callout).italic()
    //                    Text("volume: \(result.pool_volume)" )
    //
    //                }
    //
    //            }
    //            .onAppear(){
    //                API().getResults { (results) in
    //                    self.results = results
    //                }
    //            }
    
    
//     VStack(spacing: 0) {
//
//     Text("Total Hardness").font(.footnote).bold()
//     if valueTH < 40 || valueTH > 750 {
//     Text("\(Int(valueTH))").font(.title).bold().foregroundColor(Color.red)
//     } else  {
//     Text("\(Int(valueTH))").font(.title).bold()
//     }
//
//     HStack {
//     Text("\(Int(minTH))")
//
//     Slider(value: $valueTH, in: minTH...maxTH)
//
//     Text("\(Int(maxTH))")
//     }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
//     }
//     VStack(spacing: 0) {
//     Text("Total Chlorine").font(.footnote).bold()
//
//     if valueTC < 4 || valueTC > 15 {
//     Text("\(Int(valueTC))").font(.title).bold().foregroundColor(Color.red)
//     } else  {
//     Text("\(Int(valueTC))").font(.title).bold()
//     }
//
//     HStack {
//     Text("\(Int(minTC))")
//
//     Slider(value: $valueTC, in: minTC...maxTC)
//
//
//
//     Text("\(Int(maxTC))")
//     }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
//     }
//     VStack(spacing: 0) {
//     Text("Free Chlorine").font(.footnote).bold()
//
//     if valueFC < 4 || valueFC > 15 {
//     Text("\(Double(valueFC), specifier: "%.1f")").font(.title).bold().foregroundColor(Color.red)
//     } else  {
//     Text("\(Double(valueFC), specifier: "%.1f")").font(.title).bold()
//     }
//
//     HStack {
//     Text("\(Int(minFC))")
//
//     Slider(value: $valueFC, in: minFC...maxFC, step: 0.1)
//
//     Text("\(Int(maxFC))")
//     }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
//     }
//     VStack(spacing: 0) {
//     Text("pH").font(.footnote).bold()
//
//     if valuePH < 7.3 || valuePH > 8.0 {
//     Text("\(Double(valuePH), specifier: "%.1f")").font(.title).bold().foregroundColor(Color.red)
//     } else  {
//     Text("\(Double(valuePH), specifier: "%.1f")").font(.title).bold()
//     }
//
//     HStack {
//     Text("\(Int(minPH))")
//
//     Slider(value: $valuePH, in: minPH...maxPH, step: 0.1)
//
//     Text("\(Int(maxPH))")
//     }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
//     }
//     VStack(spacing: 0) {
//
//     Text("Total Alkalinity").font(.footnote).bold()
//
//     if valueTA < 40 || valueTA > 750 {
//     Text("\(Int(valueTA))").font(.title).bold().foregroundColor(Color.red)
//     } else  {
//     Text("\(Int(valueTA))").font(.title).bold()
//     }
//
//     HStack {
//     Text("\(Int(minTA))")
//
//     Slider(value: $valueTA, in: minTA...maxTA)
//
//     Text("\(Int(maxTA))")
//     }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
//     }
//     VStack(spacing: 0) {
//     Text("Stabilizer (CYA)").font(.footnote).bold()
//
//     if valueST < 40 || valueST > 750 {
//     Text("\(Int(valueST))").font(.title).bold().foregroundColor(Color.red)
//     } else  {
//     Text("\(Int(valueST))").font(.title).bold()
//     }
//
//     HStack {
//     Text("\(Int(minST))")
//
//     Slider(value: $valueST, in: minST...maxST)
//
//     Text("\(Int(maxST))")
//     }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
//     }  .navigationBarTitle(Text("Pool Water Test"), displayMode:.inline)
//
//        }
//}

//extension URLRequest {
//    mutating func setBasicAuth(username: String, password: String) {
//        let encodedAuthInfo = String(format: "%@:%@", username, password)
//            .data(using: String.Encoding.utf8)!
//            .base64EncodedString()
//        addValue("Basic \(encodedAuthInfo)", forHTTPHeaderField: "Authorization")
//        print("\(encodedAuthInfo)")
//    }
//}

struct WaterTestView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTestView()
    }
}
