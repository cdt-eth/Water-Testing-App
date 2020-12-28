//
//  TestAppApp.swift
//  TestApp
//
//  Created by Christian David Turner on 9/23/20.
//

import SwiftUI
import Firebase

@main
struct TestAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



struct TestAppApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

