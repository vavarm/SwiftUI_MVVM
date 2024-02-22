//
//  ContentView.swift
//  MVVM
//
//  Created by Valentin Racaud--Minuzzi on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var model : FestivalModel = FestivalModel(name: "My Festival")
    
    var body: some View {
        
        FestivalView(festival : model)
        FestivalView(festival : model)
    }
}

#Preview {
    ContentView()
}
