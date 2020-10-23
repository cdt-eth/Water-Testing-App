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


struct ContentView: View {
    @State private  var selection: String? = nil

    var body: some View {
        
        Home()

//        NavigationView{
//            VStack(spacing: 30){
//
//                NavigationLink(destination: Text("Customers List"), tag: "My Customers", selection: $selection) { EmptyView() }
//                NavigationLink(destination: Text("Scan test strip"), tag: "Water Test", selection: $selection) {
//                    HStack {
//                    Image(systemName: "eyedropper.halffull")
//                        .font(.title)
//                        .foregroundColor(.white)
//                    //                                .padding()
//                    Text("TEST POOL WATER NOW")
//                        .font(.callout)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .padding()
//                }
//                .padding(.horizontal, 20)
//                .background(Color("DarkBlue"))
//                .cornerRadius(10)
//                .frame(maxWidth: .infinity)}
////
////                Button("View My Customers"){
////                    selection = "My Customers"
////                }
//                Button("Test your pool water"){
//                    selection = "Water Test"
//                }
////                .navigationTitle("Navigation")
//            }
//        }
    }
}
    
//    struct ContentView: View {
//        var body: some View {
//
//            Home()
//        }
//    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

    
    var body: some View {
        ZStack(alignment: .leading){
            NavigationView {
                VStack{
                    ZStack{
                        HStack{
                            
                            Button(action: {
                                withAnimation(.default){
                                    show.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .font(.title)
                            }

                            Spacer()
                            
                            Image("BioLab")
                                .resizable()
                                .frame(width: 140, height: 60)
                            
                            Spacer()

                        }
                        .padding()
                        .foregroundColor(.primary)
                        .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1)
                                    .shadow(radius:1).edgesIgnoringSafeArea(.all))
                        
                        Spacer()
                        
                        Image("home-pool")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom, 35)
                        
                        
                        
                        Text("Test your pool water for immediate and accurate product and dosage recommendations.")
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                        
                        Spacer()
                    
                        Button(action: {
                           
                            print("hi")
                        }) {
                            HStack {
                                Image(systemName: "eyedropper.halffull")
                                    .font(.title)
                                    .foregroundColor(.white)
                                //                                .padding()
                                Text("TEST POOL WATER NOW")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .padding(.horizontal, 20)
                            .background(Color("DarkBlue"))
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                            //                        .padding(.top, 50)

                            
                            Image(systemName: "person")
                                .font(.title)
                        }
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1)
                                .shadow(radius:1).edgesIgnoringSafeArea(.all))
                    
                    Spacer()
                    
                    Image("home-pool")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 35)
                    
                    Text("Test your pool water for immediate and accurate product and dosage recommendations.")
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: WaterTestView()) {
                        HStack {
                            Image(systemName: "eyedropper.halffull")
                                .font(.title)
                                .foregroundColor(.white)
                            
                            Text("TEST POOL WATER NOW")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .padding(.horizontal, 20)
                        .background(Color("DarkBlue"))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                    }.padding(.bottom, 60)
                }.navigationBarTitle("")
                .navigationBarHidden(true)
            }
            
            
            // Popout Menu
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



// Popout Menu
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
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
                Spacer()
                
            }
            .padding(.top)
            .padding(.bottom, 25)
            
            
            Image("BioLab")
                .resizable()
                .frame(width: 140, height: 60)
            
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
