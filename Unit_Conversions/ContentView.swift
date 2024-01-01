//
//  ContentView.swift
//  Unit_Conversions
//
//  Created by surya sai on 01/01/24.
//

import SwiftUI

struct ContentView: View {
    
    let conversions = ["Temperature":AnyView(Temperature()),"Length":AnyView(Length()),"Volume":AnyView(Volume())]
    let conversion = ["Temperature","Length","Volume"]
    var body: some View {
        NavigationStack {
            List(conversion, id: \.self) { name in
                NavigationLink(name) {conversions[name]!}
          }
            .navigationTitle("Unit Conversions").font(.headline)
        }
    }
}
#Preview {
    ContentView()
}
