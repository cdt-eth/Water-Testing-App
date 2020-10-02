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
                    
                    Image(systemName: "square.and.pencil")
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
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                }) {
                    
                    Image("togglebutton")
                        .resizable()
                        .frame(width:50, height:30)
                        .rotationEffect(.init(degrees: self.dark ? 180 : 0))
                    
                }
            }
            .padding(.top, 25)
            
            Group {
                
                // MY CUSTOMERS
                Button(action: {
                    
                }) {
                    
                    HStack(spacing: 22) {
                        
                        Image("my_customers")
                            .resizable()
                            .frame(width:40, height:40)
                        
                        Text("My Customers")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                
                // WATER TEST
                Button(action: {
                    
                }) {
                    
                    HStack(spacing: 22) {
                        
                        Image("water_test")
                            .resizable()
                            .frame(width:40, height:40)
                        
                        Text("Water Test")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                
                Divider()
                    .padding(.top, 25)
                
                
                // VOLUME CALCULATOR
                Button(action: {
                    
                }) {
                    
                    HStack(spacing: 22) {
                        
                        Image("volume_calculator")
                            .resizable()
                            .frame(width:40, height:40)
                        
                        Text("Volume Calculator")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                
                
                // CONTACT US
                Button(action: {
                    
                }) {
                    
                    HStack(spacing: 22) {
                        
                        Image("contact_us")
                            .resizable()
                            .frame(width:40, height:40)
                        
                        Text("Contact Us")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                
                
                // WEBSITE
                Button(action: {
                    
                }) {
                    
                    HStack(spacing: 22) {
                        
                        Image("website")
                            .resizable()
                            .frame(width:40, height:40)
                        
                        Text("Website")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                
                // LOGOUT
                Button(action: {
                    
                }) {
                    
                    HStack(spacing: 22) {
                        
                        Image("logout")
                            .resizable()
                            .frame(width:40, height:40)
                        
                        Text("Logout")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
            }
            
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
