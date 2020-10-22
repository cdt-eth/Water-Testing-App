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
    
    var body: some View {

        
        VStack(spacing: 0) {
            Text("Total Hardness").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }

        VStack(spacing: 0) {
            Text("Total Chlorine").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        
        VStack(spacing: 0) {
            Text("Free Chlorine").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        
        VStack(spacing: 0) {
            Text("pH").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        
        VStack(spacing: 0) {
            
            Text("Total Alkalinity").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        
        VStack(spacing: 0) {
            Text("Stabilizer").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        .navigationBarTitle(Text("Pool Water Test"), displayMode:.inline)
    }
}

struct WaterTestView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTestView()
    }
}
