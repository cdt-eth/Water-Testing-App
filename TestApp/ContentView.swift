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
                    
                    ZStack{
                        
                        HStack{
                            Button(action: {
                                withAnimation(.default){
                                    show.toggle()
                                }
                            }) {
                                Image("menu")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            Spacer()
                        }
                        Text("Home")
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1)
                                .shadow(radius:3).edgesIgnoringSafeArea(.all))
                    
                    Spacer()
                    
                    Text("Dark Mode Menu")
                    
                    Spacer()
                }
            }
            
            HStack {
                Menu(dark: $dark, show: $show)
                    .preferredColorScheme(dark ? .dark : .light)
                    .offset(x: show ? 0 : -UIScreen.main.bounds.width / 1.5)
                
                Spacer(minLength: 0)
            }
            .background(Color.primary.opacity(show ? (dark ? 0.05 : 0.2) : 0).edgesIgnoringSafeArea(.all))
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
                    withAnimation(.default){
                        show.toggle()
                    }
                }) {
                    Image("back")
                        .resizable()
                        .frame(width:20, height: 20)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "eyedropper.halffull")
                        .font(.title)
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
            

            Image("BioLab")
                .resizable()
                .frame(width: 140, height: 60)
            
            VStack(spacing: 12){
                Text("Water Testing App")
                Text("© 2020").font(.caption)
            }.padding(.top, 25)
       
            Divider()
                .padding()
            
            Navigation()
            
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background((dark ? Color.black : Color.white).edgesIgnoringSafeArea(.all))
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2)
                    .shadow(radius:3 )
                    .edgesIgnoringSafeArea(.all)
        )
    }
}
