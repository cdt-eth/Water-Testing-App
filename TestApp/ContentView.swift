//
//  ContentView.swift
//  TestApp
//
//  Created by Christian David Turner on 9/23/20.
//

import SwiftUI


struct ContentView: View {
    
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    
                    MainView(showMenu: $showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: showMenu ? geometry.size.width/2 : 0)
                    //                        .disabled(showMenu ? true : false)
                    
                    
                    if showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
                
            }
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
        }
    }
}

struct MainView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack(alignment: .leading){
            NavigationView {
                VStack{
                    
                    ZStack{
                        HStack{
                            Button(action: {
                                withAnimation {
                                    showMenu.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .imageScale(.large)
                            }
                            
                            Spacer()
                            
                            Image("BioLab")
                                .resizable()
                                .frame(width: 140, height: 60)
                            
                            Spacer()
                            
                            NavigationLink(destination: CustomerView()) {
                                Image(systemName: "person")
                                    .font(.title)
                                }
//                            Image(systemName: "person")
//                                .font(.title)
                        }
                    }
                    .padding()
                    .foregroundColor(.primary)
                    //                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    //                                .shadow(radius:1).edgesIgnoringSafeArea(.all))
                    
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
                    
                                        NavigationLink(destination: PostList()) {
//                    NavigationLink(destination: VolumeCalculator()) {
                        //                    NavigationLink(destination: WaterTestView()) {
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
            } .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
