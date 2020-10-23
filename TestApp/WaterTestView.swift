//
//  WaterTestView.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/5/20.
//

import SwiftUI

struct WaterTestView: View {
    @State var sliderValue = 0.0
    var minimumValue = 0.0
    var maximumvalue = 100.0
    
    // Total Hardness
    @State var valueTH = 0.0
    var minTH = 0.0
    var maxTH = 1000.0
    
    // Total Chlorine
    @State var valueTC = 0.0
    var minTC = 0.0
    var maxTC = 20.0
    
    // Free Chlorine
    @State var valueFC = 0.0
    var minFC = 0.0
    var maxFC = 20.0
    
    // pH
    @State var valuePH = 1.0
    var minPH = 1.0
    var maxPH = 14.0
    
    // Total Alkalinity
    @State var valueTA = 0.0
    var minTA = 0.0
    var maxTA = 1000.0
    
    // Stabilizer (CYA)
    @State var valueST = 0.0
    var minST = 0.0
    var maxST = 1000.0
    
    var body: some View {

        
        VStack(spacing: 0) {
            Text("Total Hardness").font(.footnote).bold()
            Text("\(Int(valueTH))").font(.title).bold()
            
            HStack {
                Text("\(Int(minTH))")
                
                Slider(value: $valueTH, in: minTH...maxTH)
                
                Text("\(Int(maxTH))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }

        VStack(spacing: 0) {
            Text("Total Chlorine").font(.footnote).bold()
            Text("\(Int(valueTC))").font(.title).bold()
            
            HStack {
                Text("\(Int(minTC))")
                
                Slider(value: $valueTC, in: minTC...maxTC)
                
                Text("\(Int(maxTC))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        
        VStack(spacing: 0) {
            Text("Free Chlorine").font(.footnote).bold()
            Text("\(Double(valueFC), specifier: "%.1f")").font(.title).bold()
            
            HStack {
                Text("\(Int(minFC))")
                
                Slider(value: $valueFC, in: minFC...maxFC, step: 0.1)
                
                Text("\(Int(maxFC))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }

        VStack(spacing: 0) {
            Text("pH").font(.footnote).bold()
            Text("\(Double(valuePH), specifier: "%.1f")").font(.title).bold()
            
            HStack {
                Text("\(Int(minPH))")
                
                Slider(value: $valuePH, in: minPH...maxPH, step: 0.1)
                
                Text("\(Int(maxPH))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }

        VStack(spacing: 0) {

            Text("Total Alkalinity").font(.footnote).bold()
            Text("\(Int(valueTA))").font(.title).bold()
            
            HStack {
                Text("\(Int(minTA))")
                
                Slider(value: $valueTA, in: minTA...maxTA)
                
                Text("\(Int(maxTA))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }

        VStack(spacing: 0) {
            Text("Stabilizer (CYA)").font(.footnote).bold()
            Text("\(Int(valueST))").font(.title).bold()
            
            HStack {
                Text("\(Int(minST))")
                
                Slider(value: $valueST, in: minST...maxST)
                
                Text("\(Int(maxST))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        .navigationBarTitle(Text("Pool Water Test"), displayMode:.inline)

        Text("This is the Water Test View")

        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

    }
}

struct WaterTestView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTestView()
    }
}
