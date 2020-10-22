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
        
        Text("This is the Water Test View")
            .padding(.bottom,25)
        
        VStack {
            Text("Total Hardness").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }

        VStack {
            Text("Total Chlorine").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        
        VStack {
            Text("Free Chlorine").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        
        VStack {
            Text("pH").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        
        VStack {
            Text("Total Alkalinity").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        
        VStack {
            Text("Stabilizer").font(.footnote).bold()
            Text("\(Int(sliderValue))").font(.title).bold()
            
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumvalue)
                
                Text("\(Int(maximumvalue))")
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        
    }
}

struct WaterTestView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTestView()
    }
}
