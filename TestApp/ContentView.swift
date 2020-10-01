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
    
    @State var dark = false
    @State var show = false
    
    var body: some View {
        ZStack(alignment: .leading){
            GeometryReader{_ in
                VStack{
                    Text("Dark Mode Menu")
                }
            }
            Menu(dark: self.$dark, show: self.$show)
        }
    }
}


struct  Menu: View {
    
    @Binding var dark: Bool
    @Binding var show: Bool
    
    var body: some View {
        
        VStack{
            
            HStack{
                Button(action: {
                    
                }) {
                    
                    Image("back")
                        .resizable()
                        .frame(width:20, height: 20)
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
            
            Image("BioLab")
                .resizable()
                .frame(width: 160, height: 80)
            
            VStack(spacing: 12){
                
                Text("Water Testing App")
                
                Text("© 2020")
                    .font(.caption)
            }
            .padding(.top, 25)
            
            HStack(spacing: 22){
                
                Image(systemName: "moon.fill")
                    .font(.title)
                
                Text("Dark Mode")
                
                Spacer()
                
                Button(action: {
                    self.dark.toggle()
                }) {
                   
                    Image("toggle")
                        .resizable()
                        .frame(width:80, height:40)
                        .rotationEffect(.init(degrees: self.dark ? 180 : 0))
                        
                }
            }.padding(.top, 25)
            
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background((
            self.dark ? Color.black
                      : Color.white
        ).edgesIgnoringSafeArea(.all))
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2)
                            .shadow(radius:3 )
                            .edgesIgnoringSafeArea(.all)
        )
    }
}
