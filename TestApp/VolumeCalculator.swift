//
//  VolumeCalculator.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/26/20.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI


//class NumbersOnly: ObservableObject {
//    @Published var value = "" {
//        didSet {
//            let filtered = value.filter { $0.isNumber }
//
//            if value != filtered {
//                value = filtered
//            }
//        }
//    }
//}

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
    
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var shallowEndDepth: String = ""
    @State private var deepEndDepth: String = ""
    @State private var volume: String = ""
    @State var weight = 0
    
    
    var totalVolume : Double {
        guard let l = Double(length),
              let w = Double(width),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        
        return l * w * ((d+s)/2) * 7.5
    }
    
    
    var body: some View {
        
        Background {
            
            VStack {
                
                Text("Knowing how many gallons of water your pool holds allows us to provide accurate does recommendtions.")
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding()
                
                
                HStack{
                    FloatingLabelTextField($length, placeholder: "Length", editingChanged: { (isChanged) in
                        
                    }) {
                        
                    }
                    .keyboardType(.decimalPad)
                    .frame(height: 70)
                    .modifier(ThemeTextField())
                    FloatingLabelTextField($width, placeholder: "Width", editingChanged: { (isChanged) in
                        
                    }) {
                        
                    }
                    .keyboardType(.decimalPad)
                    .frame(height: 70)
                    .modifier(ThemeTextField())
                }.padding()
                
                
                HStack{
                    FloatingLabelTextField($shallowEndDepth, placeholder: "Shallow End Depth", editingChanged: { (isChanged) in
                        
                    }) {
                        
                    }
                    .keyboardType(.decimalPad)
                    .frame(height: 70)
                    .modifier(ThemeTextField())
                    FloatingLabelTextField($deepEndDepth, placeholder: "Deep End Depth", editingChanged: { (isChanged) in
                        
                    }) {
                        
                    }
                    .keyboardType(.decimalPad)
                    .frame(height: 70)
                    .modifier(ThemeTextField())
                }.padding()
                
                
                Text(" Your pool volume is: \(totalVolume, specifier: "%.0f")")
                    .font(.headline).bold()
                    .padding(.top, 50)
                
                Spacer()
                
            }.padding(.top, 50)
            //            .onTapGesture {
            //                endEditing()
            //            }
        }.onTapGesture {
            endEditing()
        }
    }
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
