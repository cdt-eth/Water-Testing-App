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


struct MyRadioButton: View {
    let id: Int
    
    @Binding var currentlySelectedId: Int
    
    let label: String
    
    var body: some View {
        
        Button(label , action: { currentlySelectedId = id })
            .foregroundColor(id == currentlySelectedId ? .green : .red)
        
    }
}


struct MyRadioButtons: View {
    
    init(selection: Binding<Int>) {
        _currentlySelectedId = selection
    }
    
    @Binding var currentlySelectedId: Int
    
    var body: some View {
        HStack {
            MyRadioButton(id: 1, currentlySelectedId: $currentlySelectedId, label: "Rectangle" )
            MyRadioButton(id: 2, currentlySelectedId: $currentlySelectedId, label: "Round" )
            MyRadioButton(id: 3, currentlySelectedId: $currentlySelectedId, label: "Oval" )
            MyRadioButton(id: 4, currentlySelectedId: $currentlySelectedId, label: "Kidney" )
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
    
    @State private var pi: Double = 3.14
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var longWidth: String = ""
    @State private var shortWidth: String = ""
    @State private var diameter: String = ""
    @State private var shallowEndDepth: String = ""
    @State private var deepEndDepth: String = ""
    @State private var volume: String = ""
    @State var weight = 0
    @State var selection: Int = 0
    
    
    var rectVolume : Double {
        guard let l = Double(length),
              let w = Double(width),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        return l * w * ((d+s)/2) * 7.5
    }
    
    var roundVolume : Double {
        guard let di = Double(diameter),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        // Diameter * Diameter * Depth * 5.9
        // 3.14 x diameter x average depth x 7.5
        return di * pi * ((d+s)/2) * 7.5
    }
    
    var ovalVolume : Double {
        guard let l = Double(length),
              let w = Double(width),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        return l * w * ((d+s)/2) * 5.9
    }

    var kidneyVolume : Double {
        guard let l = Double(length),
              let sw = Double(shortWidth),
              let lw = Double(longWidth),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        return l * (sw + lw) * 0.45 * ((d+s)/2) * 7.5
    }
    
    
    var body: some View {
        
        Background {
            
            VStack {
                Text("Knowing how many gallons of water your pool holds allows us to provide accurate does recommendtions.")
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding()
                
                
                MyRadioButtons(selection: $selection)
                
                // MARK: - RECTANGLE START
                if selection == 1  {
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
                    
                    Text(" Your pool volume is: \(rectVolume, specifier: "%.0f")")
                        .font(.headline).bold()
                        .padding(.top, 50)
                    
                }
                // MARK: - RECTANGLE END
                
                
                
                // MARK: - ROUND START
                if selection == 2  {
                    VStack{
                        FloatingLabelTextField($diameter, placeholder: "Diameter", editingChanged: { (isChanged) in
                            
                        }) {
                            
                        }
                        .keyboardType(.decimalPad)
                        .frame(height: 70)
                        .modifier(ThemeTextField())
                        
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
                    
                    
                    Text(" Your pool volume is: \(roundVolume, specifier: "%.0f")")
                        .font(.headline).bold()
                        .padding(.top, 50)
                  
                    
                }
                // MARK: - ROUND END
                
                
                // MARK: - OVAL START
                if selection == 3  {
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
                    
                    Text(" Your pool volume is: \(ovalVolume, specifier: "%.0f")")
                        .font(.headline).bold()
                        .padding(.top, 50)
                    
                }
                // MARK: - OVAL END
                
                
                // MARK: - KIDNEY START
                if selection == 4  {
                    
                    FloatingLabelTextField($length, placeholder: "Length", editingChanged: { (isChanged) in
                        
                    }) {
                        
                    }
                    .keyboardType(.decimalPad)
                    .frame(height: 70)
                    .modifier(ThemeTextField())
                    .padding()
                    
                    HStack{
                        FloatingLabelTextField($shortWidth, placeholder: "Short Width", editingChanged: { (isChanged) in
                            
                        }) {
                            
                        }
                        .keyboardType(.decimalPad)
                        .frame(height: 70)
                        .modifier(ThemeTextField())
                        
                        FloatingLabelTextField($longWidth, placeholder: "Long Width", editingChanged: { (isChanged) in
                            
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
                    
                    Text(" Your pool volume is: \(kidneyVolume, specifier: "%.0f")")
                        .font(.headline).bold()
                        .padding(.top, 50)
                    
                }
                // MARK: - KIDNEY END

                Spacer()
                
            }.padding(.top, 50)
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
