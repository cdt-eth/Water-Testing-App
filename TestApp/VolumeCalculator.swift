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
        
        Button( action:{currentlySelectedId = id}) {
            Text("\(label)")
                .frame(width:100)
        }
        .padding(10)
        .foregroundColor(id == currentlySelectedId ? .white : .black)
        .background(id == currentlySelectedId ? Color("DarkBlue") : .white)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 2.0)
                    .fill(id == currentlySelectedId ? Color("DarkBlue") : .black)
        )
    }
}


struct MyRadioButtons: View {
    
    init(selection: Binding<Int>) {
        _currentlySelectedId = selection
    }
    
    @Binding var currentlySelectedId: Int
    
    var body: some View {
        VStack{
            HStack(spacing: 5) {
                MyRadioButton(id: 1, currentlySelectedId: $currentlySelectedId, label: "Rectangle" )
                Spacer()
                MyRadioButton(id: 2, currentlySelectedId: $currentlySelectedId, label: "Round" )
            }.frame(width: 200).padding(.bottom, 10)
            
            HStack(spacing: 5) {
                MyRadioButton(id: 3, currentlySelectedId: $currentlySelectedId, label: "Oval" )
                Spacer()
                MyRadioButton(id: 4, currentlySelectedId: $currentlySelectedId, label: "Kidney" )
            }.frame(width: 200)
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
    
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var longWidth: String = ""
    @State private var shortWidth: String = ""
    @State private var diameter: String = ""
    @State private var shallowEndDepth: String = ""
    @State private var deepEndDepth: String = ""
    @State private var volume: String = ""
    @State var selection: Int = 0
    
    var rectVolume : Double {
        guard let l = Double(length),
              let w = Double(width),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        
        // (Length * Width * ((Deep Depth + Shallow Depth)/2) * 7.5)
        return l * w * ((d+s)/2) * 7.5
    }
    
    var roundVolume : Double {
        guard let di = Double(diameter),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        
        // (Diameter * Diameter * ((Deep Depth + Shallow Depth)/2) * 5.9)
        return di * di * ((d+s)/2) * 5.9
    }
    
    var ovalVolume : Double {
        guard let l = Double(length),
              let w = Double(width),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        
        // (Length * Width * ((Deep Depth + Shallow Depth)/2) * 5.9)
        return l * w * ((d+s)/2) * 5.9
    }
    
    var kidneyVolume : Double {
        guard let l = Double(length),
              let sw = Double(shortWidth),
              let lw = Double(longWidth),
              let s = Double(shallowEndDepth),
              let d = Double(deepEndDepth)
        else { return 0 }
        
        // (Short Width + Long Width) x L x ((Deep Depth + Shallow Depth)/2) x 7.5 x 0.45
        return (sw + lw) * l * ((d+s)/2) * 7.5 * 0.45
    }
    
    @State private var isShowError: Bool = false
    
    var body: some View {
        Background {
            VStack {
                
                Text("Knowing how many gallons of water your pool holds allows us to provide accurate does recommendtions. Please select a Pool Type below.")
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding()
                
                MyRadioButtons(selection: $selection).padding()
                
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
                    
                    HStack{
                    FloatingLabelTextField($length, placeholder: "Length*", editingChanged: { (isChanged) in }) {}
                            .isShowError(true)
                            .addValidations([.init(condition: length.count < 3, errorMessage: "Maximum of two-digit numbers")])
                            .isRequiredField(true, with: "Required")
                            .floatingStyle(ThemeTextFieldStyle())
                            .modifier(ThemeTextField())
                            .keyboardType(.decimalPad)
                            .frame(height: 70)
                    }.padding()
                    
                    HStack{
                        FloatingLabelTextField($shortWidth, placeholder: "Short Width*", editingChanged: { (isChanged) in }) {}
                                .isShowError(true)
                                .addValidations([.init(condition: shortWidth.count < 3, errorMessage: "Maximum of two-digit numbers")])
                                .isRequiredField(true, with: "Required")
                                .floatingStyle(ThemeTextFieldStyle())
                                .modifier(ThemeTextField())
                                .keyboardType(.decimalPad)
                                .frame(height: 70)
                        
                        FloatingLabelTextField($longWidth, placeholder: "Long Width*", editingChanged: { (isChanged) in }) {}
                                .isShowError(true)
                                .addValidations([.init(condition: longWidth.count < 3, errorMessage: "Maximum of two-digit numbers")])
                                .isRequiredField(true, with: "Required")
                                .floatingStyle(ThemeTextFieldStyle())
                                .modifier(ThemeTextField())
                                .keyboardType(.decimalPad)
                                .frame(height: 70)
                    }.padding()
                    
                    HStack{
                        
                        FloatingLabelTextField($shallowEndDepth, placeholder: "Shallow End Depth*", editingChanged: { (isChanged) in }) {}
                                .isShowError(true)
                                .addValidations([.init(condition: shallowEndDepth.count < 3, errorMessage: "Maximum of two-digit numbers")])
                                .isRequiredField(true, with: "Required")
                                .floatingStyle(ThemeTextFieldStyle())
                                .modifier(ThemeTextField())
                                .keyboardType(.decimalPad)
                                .frame(height: 70)
                        
                        FloatingLabelTextField($deepEndDepth, placeholder: "Deep End Depth*", editingChanged: { (isChanged) in }) {}
                                .isShowError(true)
                                .addValidations([.init(condition: deepEndDepth.count < 3, errorMessage: "Maximum of two-digit numbers")])
                                .isRequiredField(true, with: "Required")
                                .floatingStyle(ThemeTextFieldStyle())
                                .modifier(ThemeTextField())
                                .keyboardType(.decimalPad)
                                .frame(height: 70)
                    }.padding()
                    
                    
                    if isShowError == false  {
                        Text(" Your pool volume is: \(kidneyVolume, specifier: "%.0f")")
                            .font(.headline).bold()
                            .padding(.top, 50)
                    }
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
