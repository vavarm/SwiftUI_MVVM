//
//  FestivalView.swift
//  MVVM
//
//  Created by Valentin Racaud--Minuzzi on 20/02/2024.
//

import SwiftUI

struct FestivalView : View {
    var cols = [GridItem](repeating:.init(.flexible()), count:2)
    
    @ObservedObject var festivalViewModel : FestivalViewModel
    
    init(festival : Festival){
        festivalViewModel = FestivalViewModel(festival : festival)
    }
    
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 20)
            HStack{
                LazyVGrid(columns: ViewUtils.columns, spacing: 5){
                    Text("Name:"); TextField("Enter your name", text: $festivalViewModel.name)
                        .textFieldStyle(.roundedBorder)
                    Text("Number of tables:"); Stepper(
                        value: $festivalViewModel.numberOfTables,
                        in: 0...100,
                        step: 1
                    ) {Text("\(festivalViewModel.numberOfTables)")}
                    Text("Table price:"); TextField("Enter a price", value: $festivalViewModel.tablePrice, formatter: ViewUtils.currencyFormatter)
                        .textFieldStyle(.roundedBorder)
                    Text("m2 price:"); Text(ViewUtils.FormatDoubleToCurrencyString(festivalViewModel.m2price))
                    Text("Max revenue:"); Text(ViewUtils.FormatDoubleToCurrencyString(festivalViewModel.maxRevenue))
                }
            }
            Spacer().frame(height: 40)
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Button("Default number"){
                    festivalViewModel.numberOfTables = 0
                }
                .padding(10)
                .frame(width: 138)
                .background(.teal.opacity(0.25))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.teal, lineWidth: 3)
                )
                Button("Default price"){
                    festivalViewModel.tablePrice = 0
                }
                .padding(10)
                .frame(width: 138)
                .background(ViewUtils.salmon.opacity(0.25))
                .foregroundColor(ViewUtils.salmon)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(ViewUtils.salmon, lineWidth: 3)
                )
            }
            Spacer().frame(height: 40)
        }.padding(20)
    }
}
