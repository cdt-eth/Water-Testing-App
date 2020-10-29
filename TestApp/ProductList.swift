//
//  ProductList.swift
//  Water Testting
//
//  Created by Christian David Turner on 10/28/20.
//

import SwiftUI

// URL of Image -> Image
struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }
    
    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading
        
        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }
            
            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }
                
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }
    
    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image
    
    var body: some View {
        selectImage()
            .resizable()
    }
    
    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }
    
    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}

// Capitalize First letter
extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

struct ProductList: View {
    @State var products: [Product] = []
    
    var body: some View {
        
        Text("Product List")
            .font(.title)
            .bold()
            .padding(.top, 0)
        
        Divider()
        
        List(products){ product in
            
            let jsonURL = (product.image ?? "https://breakthrough.org/wp-content/uploads/2018/10/default-placeholder-image.png")
            
            VStack{
                VStack{
                    RemoteImage(url: jsonURL)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                    
                    Text(product.name)
                        .font(.headline)
                        .textCase(.uppercase)
                        .foregroundColor(Color("DarkBlue"))
                        .multilineTextAlignment(.center)
                        .frame(width:250)
                    
                    Text(product.upc ?? "N/A").font(.callout).italic()
                }.padding(.bottom, 15)
                
                HStack{
                    VStack(alignment: .leading){
                        Text(product.category?.firstCapitalized ?? "N/A")
                        Text(product.sku).foregroundColor(Color.gray)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("sz: \(product.size ?? "N/A")")
                        Text("ct: \(product.pack_count)" )
                    }
                }
            }.padding()
            
        }
        .onAppear(){
            API().getProducts { (products) in
                self.products = products
            }
        }
    }
}


struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
