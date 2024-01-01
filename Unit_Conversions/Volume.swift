//
//  Volume.swift
//  Day1_challenge
//
//  Created by surya sai on 25/12/23.
//

import SwiftUI

struct Volume: View {
    @State private var inputVolumeSelected = "Milliliters"
    @State private var outputVolumeSelected = "Liters"
   @State var volume = 0.0
    @FocusState var isFoused:Bool
    

    var outputTemperature:Double {
        let input = inputVolumeSelected == "Milliliters" ? UnitVolume.milliliters:inputVolumeSelected == "Liters" ? UnitVolume.liters:UnitVolume.gallons
        
        let output =  outputVolumeSelected == "Milliliters" ? UnitVolume.milliliters:outputVolumeSelected == "Liters" ? UnitVolume.liters:UnitVolume.gallons
        
        
        let convertor = Measurement<UnitVolume>(value: volume, unit:input)
        let outputVolume  = convertor.converted(to: output).value
        return outputVolume
    }
    
    let temperatureScales = ["Milliliters","Liters","Gallons"]
    var body: some View {
        Form {
            Section("Volume Scale") {
                Picker("Input Scale", selection: $inputVolumeSelected ) {
                    ForEach(temperatureScales, id:\.self) {
                        Text($0)
                    }
                }
                TextField("Enter Volume",value:$volume,format: .number)
                    .focused($isFoused)
                    .keyboardType(.decimalPad)
                
                Picker("Output Scale", selection: $outputVolumeSelected) {
                    ForEach(temperatureScales, id:\.self) {
                        Text($0)
                    }
                }
                Text(outputTemperature,format: .number)
            }
        }.toolbar{
            if isFoused {
                Button("Done"){isFoused = false}
            }
        }
        }
}

#Preview {
    Volume()
}
