//
//  Navigation.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/2/20.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
//        
        VStack(alignment: .leading) {
            
//            Button(action: {
//                withAnimation {
//                    showMenu.toggle()
//                }
//            }) {
//                Image(systemName: "line.horizontal.3")
//                    .imageScale(.large)
//            }
            
            HStack {
                NavigationLink(destination: CustomerView()) {
                    Text("My Customers")
                        .font(.headline)
                        .foregroundColor(Color.black)
                }
            }.padding(.top, 150)
            
            HStack {
                NavigationLink(destination: WaterTestView()) {
                    Text("Water Test")
                        .font(.headline)
                        .foregroundColor(Color.black)
                }
            }.padding(.top, 25)
            
            HStack {
                NavigationLink(destination: WaterTestView()) {
                    Text("Volume Calculator")
                        .font(.headline)
                        .foregroundColor(Color.black)
                }
            }.padding(.top, 25)
            
            HStack {
                NavigationLink(destination: WaterTestView()) {
                    Text("Contact Us")
                        .font(.headline)
                        .foregroundColor(Color.black)
                }
            }.padding(.top, 25)
            
            
            HStack {
                if #available(iOS 14.0, *) {
                    Link("Website", destination: URL(string: "https://www.proseriespool.com")!)
                        .font(.headline)
                        .foregroundColor(Color.black)
                } else {
                    // Fallback on earlier versions
                }
            }.padding(.top, 25)
            
            HStack {
                NavigationLink(destination: WaterTestView()) {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(Color.black)
                }
            }.padding(.top, 25)
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        //        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
        .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    .shadow(radius:1).edgesIgnoringSafeArea(.all))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}





























//struct Navigation: View {
//    var body: some View {
//        NavigationView {
////        List{
//            VStack{
//                NavigationLink(destination: CustomerView()) {
//                    HStack(spacing: 22) {
//                        Text("My Customers")
//                        Spacer()
//                    }
//                }.padding(.top, 25)
//
//                NavigationLink(destination: WaterTestView()) {
//                    HStack(spacing: 22) {
//                        Text("Water Test")
//                        Spacer()
//                    }
//                }.padding(.top, 25)
//
//                NavigationLink(destination: WaterTestView()) {
//                    HStack(spacing: 22) {
//                        Text("Volume Calculator")
//                        Spacer()
//                    }
//                }.padding(.top, 25)
//
//                NavigationLink(destination: WaterTestView()) {
//                    HStack(spacing: 22) {
//                        Text("Contact Us")
//                        Spacer()
//                    }
//                }.padding(.top, 25)
//
//
//                HStack(spacing: 22) {
//                    Link("Website", destination: URL(string: "https://www.proseriespool.com")!)
//                    Spacer()
//                }.padding(.top, 25)
//
//
//                NavigationLink(destination: WaterTestView()) {
//                    HStack(spacing: 22) {
//                        Text("Logout")
//                        Spacer()
//                    }
//                }.padding(.top, 25)
//
//
//            }
//            .navigationBarTitle("")
//            .navigationBarHidden(true)
//        }
//    .padding(.bottom,300)
//    }
//}

//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        Navigation()
//    }
//}
