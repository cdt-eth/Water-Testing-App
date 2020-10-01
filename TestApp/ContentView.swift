//
//  ContentView.swift
//  TestApp
//
//  Created by Christian David Turner on 9/23/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        ZStack(alignment: .leading){
            GeometryReader{_ in
                VStack{
                    Text("Dark Mode Menu")
                }
            }
            Menu()
        }
    }
}


struct  Menu: View {
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    
                }) {
                    Image("back")
                        .resizable()
                        .frame(width:12, height: 20)
                }
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
            
            Image("pic")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            VStack(spacing: 12){
                
                Text("Christian")
                
                Text("Developer")
                    .font(.caption)
            }
            .padding(.top, 25)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .padding(.horizontal, 20)
    }
}
