//
//  TestList.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/28/20.
//

import SwiftUI

struct TestList: View {
    @State var tests: [Test] = []

    var body: some View {

        List(tests){ test in
            HStack{
                VStack(alignment: .leading){
                    Text(test.name)
                    Text(test.sku)
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text(test.size ?? "")
                    Text("\(test.pack_count)" )
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
