//
//  ContentView.swift
//  MVVM
//
//  Created by Valentin Racaud--Minuzzi on 20/02/2024.
//

import SwiftUI

let defaultNumber = 64
let defaultPrice = 100.0

struct ContentView: View {
    
    var model : Festival = Festival(name: "My Festival")
    
    var body: some View {
        
        FestivalView(festival : model)
        FestivalView(festival : model)
    }
}

#Preview {
    ContentView()
}
