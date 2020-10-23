//
//  Navigation.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/2/20.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: CustomerView()) {
                    HStack(spacing: 22) {
                        Text("My Customers")
                        Spacer()
                    }
                }.padding(.top, 25)
                
                NavigationLink(destination: WaterTestView()) {
                    HStack(spacing: 22) {
                        Text("Water Test")
                        Spacer()
                    }
                }.padding(.top, 25)
                
                NavigationLink(destination: WaterTestView()) {
                    HStack(spacing: 22) {
                        Text("Volume Calculator")
                        Spacer()
                    }
                }.padding(.top, 25)
                
                NavigationLink(destination: WaterTestView()) {
                    HStack(spacing: 22) {
                        Text("Contact Us")
                        Spacer()
                    }
                }.padding(.top, 25)
                
                //                NavigationLink(destination: WaterTestView()) {
                //                    HStack(spacing: 22) {
                //                        Text("Website")
                //                        Spacer()
                //                    }
                //                }.padding(.top, 25)
                
                HStack(spacing: 22) {
                    Link("Website", destination: URL(string: "https://www.proseriespool.com")!)
                    Spacer()
                }.padding(.top, 25)
                
                
                NavigationLink(destination: WaterTestView()) {
                    HStack(spacing: 22) {
                        Text("Logout")
                        Spacer()
                    }
                }.padding(.top, 25)
                
                //                Spacer()
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            
            
            //                    Group {
            ////             MY CUSTOMERS
            //                        Button(action: {
            //
            //                        }) {
            //                            HStack(spacing: 22) {
            //
            //                                Text("My Customers")
            //                                Spacer()
            //                            }
            //                        }
            //                        .padding(.top, 25)
            //
            //
            //                        // WATER TEST
            //                        Button(action: {
            //
            //                        }) {
            //                            HStack(spacing: 22) {
            //                                Text("Water Test")
            //                                Spacer()
            //                            }
            //                        }
            //                        .padding(.top, 25)
            //
            //
            //                        // VOLUME CALCULATOR
            //                        Button(action: {
            //
            //                        }) {
            //                            HStack(spacing: 22) {
            //                                Text("Volume Calculator")
            //                                Spacer()
            //                            }
            //                        }
            //                        .padding(.top, 25)
            //
            //
            //
            //                        // CONTACT US
            //                        Button(action: {
            //
            //                        }) {
            //                            HStack(spacing: 22) {
            //                                Text("Contact Us")
            //                                Spacer()
            //                            }
            //                        }
            //                        .padding(.top, 25)
            //
            //
            //
            //                        // WEBSITE
            //                        Button(action: {
            //
            //                        }) {
            //                            HStack(spacing: 22) {
            //                                Text("Website")
            //                                Spacer()
            //                            }
            //                        }
            //                        .padding(.top, 25)
            //
            //
            //                        // LOGOUT
            //                        Button(action: {
            ////                            WaterTestView()
            //                        }) {
            //                            HStack(spacing: 22) {
            //                                Text("Logout")
            //                                Spacer()
            //                            }
            //                        }
            //                        .padding(.top, 25)
            //
            //        }
        }.padding(.bottom,300)
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
