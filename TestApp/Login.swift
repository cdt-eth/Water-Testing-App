//
//  Login.swift
//  Water Testing
//
//  Created by Christian Turner on 12/28/20.
//

import SwiftUI
import Firebase




struct Login: View {
    
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false

//    @EnvironmentObject var session: SessionStore
//
//    func signIn () {
//        loading = true
//        error = false
//        session.signIn(email: email, password: password) { (result, error) in
//            self.loading = false
//            if error != nil {
//                self.error = true
//            } else {
//                self.email = ""
//                self.password = ""
//            }
//        }
//    }
    
    var body: some View {
        VStack {
                    TextField($email, placeholder: Text("email address"))
                    SecureField($password, placeholder: Text("Password"))
                    if (error) {
                        Text("ahhh crap")
                    }
            
            Button(action: {
                Text("Sign in")
            }) {
                
            }
            
                    
//                Button(action: signIn) {
//                        Text("Sign in")
//                    }
                }
    }
    
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
