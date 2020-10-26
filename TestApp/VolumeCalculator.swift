//
//  VolumeCalculator.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/26/20.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

//import UIKit
//import MaterialComponents.MaterialTextFields

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

//
//class ViewController:UIViewController{
//    var textController: MDCTextInputControllerOutlined!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let textFieldFloating = MDCTextField(frame: CGRect(x:0, y: 20, width: self.view.frame.width - 50, height:50))
//        textFieldFloating.placeholder = "Username"
//        textFieldFloating.center = self.view.center
//
//            self.view.addSubView(textFieldFloating)
//
//
//        self.textController = MDCTextInputControllerOutlined(textInput: textFieldFloating)
//        self.textController.textInsets(UIEdgeInsets(top:16,left:16, bottom:16, right:16))
//    }
//}
//


struct VolumeCalculator: View {

    @State var input = 0.0
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
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
                HStack{
                    FloatingLabelTextField($firstName, placeholder: "First Name", editingChanged: { (isChanged) in
                            }) {
                    }.frame(height: 70)
                    
                    FloatingLabelTextField($lastName, placeholder: "Last Name", editingChanged: { (isChanged) in
                            }) {
                    }.frame(height: 70)
                }.padding()
                
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
