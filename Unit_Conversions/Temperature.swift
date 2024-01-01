//
//  Temperature.swift
//  Day1_challenge
//
//  Created by surya sai on 24/12/23.
//

import SwiftUI

struct Temperature: View {
    
    @State private var inputTemperatureSelected = "Celsius"
    @State private var outputTemperatureSelected = "Fahrenheit"
   @State var temperature = 0.0
    @FocusState var isFoused:Bool
    

    var outputTemperature:Double {
        let input = inputTemperatureSelected == "Celsius" ? UnitTemperature.celsius:inputTemperatureSelected == "Kelvin" ? UnitTemperature.kelvin:UnitTemperature.fahrenheit
        
        let output = outputTemperatureSelected == "Celsius" ? UnitTemperature.celsius:outputTemperatureSelected == "Kelvin" ? UnitTemperature.kelvin:UnitTemperature.fahrenheit
        
        let convertor = Measurement<UnitTemperature>(value: temperature, unit:input)
        let outputtempature  = convertor.converted(to: output).value
        return outputtempature
    }
    
    let temperatureScales = ["Celsius","Fahrenheit","Kelvin"]
    var body: some View {
        Form {
            Section("Temperature Scale") {
                Picker("Input Scale", selection: $inputTemperatureSelected ) {
                    ForEach(temperatureScales, id:\.self) {
                        Text($0)
                    }
                }
                TextField("Enter temperature",value:$temperature,format: .number)
                    .focused($isFoused)
                    .keyboardType(.decimalPad)
                
                Picker("Output Scale", selection: $outputTemperatureSelected) {
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
    Temperature()
}
