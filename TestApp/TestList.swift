//
//  TestList.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/28/20.
//

import SwiftUI


extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

struct TestList: View {
    @State var tests: [Test] = []

    var body: some View {
    
        Text("Product List").font(.title).bold().padding(.top, 0)
        
        Divider()
        
        List(tests){ test in
            VStack{
                Text(test.name)
                    .font(.headline)
                    .textCase(.uppercase)
                    .foregroundColor(Color("DarkBlue"))
                    .padding(.bottom, 10)
                
                HStack{
                    VStack(alignment: .leading){
                        Text(test.category?.firstCapitalized ?? "N/A")
                        Text(test.sku)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text("size: \(test.size ?? "N/A")")
                        Text("count: \(test.pack_count)" )
                    }
                }
            }.padding()
        }
        .onAppear(){
            API().getTests { (tests) in
                self.tests = tests
            }
        }
    }
    
}


struct TestList_Previews: PreviewProvider {
    static var previews: some View {
        TestList()
    }
}
