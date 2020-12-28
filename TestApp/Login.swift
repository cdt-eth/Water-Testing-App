//
//  Login.swift
//  Water Testing
//
//  Created by Christian Turner on 12/28/20.
//

import SwiftUI
import Firebase

//func login() {
//    self.isLoading = true
//
//    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//         self.isLoading = false
//
//             if error != nil {
//             self.alertMessage = error?.localizedDescription ?? ""
//             self.showAlert = true
//         } else {
//             self.isSuccessful = true
//
//                     DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//                            self.isSuccessful = false
//                     }
//         }
//      }
//}


struct Login: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
