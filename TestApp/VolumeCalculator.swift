//
//  VolumeCalculator.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/26/20.
//

import SwiftUI


class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct Background<Content: View>: View {
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Color.white
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .overlay(content)
    }
}



struct VolumeCalculator: View {
    
    @State var input = 0.0
    
    var body: some View {
        let someNumberProxy = Binding<String>(
            get: { String(format: "%.01f", Double(input)) },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    input = value.doubleValue
                }
            }
        )
        
        return Background {
            VStack {
                TextField("Number", text: someNumberProxy)
                    .padding()
                    .keyboardType(.decimalPad)
                
                Text("number: \(input)")
            }
        }.onTapGesture {
            endEditing()
        }
    }
    
    //    @ObservedObject var input = NumbersOnly()
    //
    //    var body: some View {
    //
    //        Background {
    //            VStack {
    //                TextField("Input", text: $input.value, onCommit:  {
    //                    endEditing()
    //                }).padding()
    //                .keyboardType(.decimalPad)
    //                Text("Volume!")
    //                    .padding()
    //            }
    //        }.onTapGesture {
    //            endEditing()
    //        }
    //    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct VolumeCalculator_Previews: PreviewProvider {
    static var previews: some View {
        VolumeCalculator()
    }
}
