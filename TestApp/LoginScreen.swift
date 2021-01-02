//
//  LoginScreen.swift
//  Water Testing
//
//  Created by Christian Turner on 1/1/21.
//

import SwiftUI



struct LoginScreen: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                Text("Hello user!")
            } else {
//                Text("Our authentication screen goes here...")
                SignInView()
            }
        }.onAppear(perform: getUser)
    }
}

#if DEBUG
struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .environmentObject(SessionStore())
    }
}
#endif
