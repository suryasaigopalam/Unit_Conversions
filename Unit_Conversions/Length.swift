//
//  Length.swift
//  Day1_challenge
//
//  Created by surya sai on 25/12/23.
//

import SwiftUI

struct Length: View {
    @State private var inputLenghtSelected = "Centimeters"
    @State private var outputLengthSelected = "Meters"
   @State var length = 0.0
    @FocusState var isFoused:Bool
    

    var outputTemperature:Double {
        let input = inputLenghtSelected == "Centimeters" ? UnitLength.centimeters:inputLenghtSelected == "Meters" ? UnitLength.meters:UnitLength.kilometers
        
        let output =  outputLengthSelected == "Centimeters" ? UnitLength.centimeters:outputLengthSelected == "Meters" ? UnitLength.meters:UnitLength.kilometers
        
        
        let convertor = Measurement<UnitLength>(value: length, unit:input)
        let outputLength  = convertor.converted(to: output).value
        return outputLength
    }
    
    let temperatureScales = ["Centimeters","Meters","Kilometers"]
    var body: some View {
        Form {
            Section("Length Scale") {
                Picker("Input Scale", selection: $inputLenghtSelected ) {
                    ForEach(temperatureScales, id:\.self) {
                        Text($0)
                    }
                }
                TextField("Enter Length",value:$length,format: .number)
                    .focused($isFoused)
                    .keyboardType(.decimalPad)
                
                Picker("Output Scale", selection: $outputLengthSelected) {
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
    Length()
}
