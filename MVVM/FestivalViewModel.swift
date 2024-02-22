//
//  FestivalViewModel.swift
//  MVVM
//
//  Created by Valentin Racaud--Minuzzi on 20/02/2024.
//

import SwiftUI

protocol FestivalObserver{
    var name : String {get}
    var numberOfTables : Int {get}
    var tablePrice : Double {get}
    
    
    func nameChanged(name : String)
    
    func numberOfTablesChanged(number : Int)
    
    func tablePriceChanged(price : Double)

}

class FestivalViewModel : FestivalObserver, ObservableObject {
    @Published public var name : String {
        didSet{
            if name != oldValue{
                modelFestival.name = name
            }
        }
    }
    @Published var numberOfTables : Int = 64 {
        didSet{
            if numberOfTables != oldValue{
                modelFestival.numberOfTables = numberOfTables
                
            }
        }
    }
    @Published var tablePrice : Double = 100.0 {
        didSet{
            if tablePrice != oldValue {
                modelFestival.tablePrice = tablePrice
            }
        }
    }
    
    public var m2price : Double {
        return round (tablePrice*10/FestivalModel.sqmTable/10)
    }
    
    public var maxRevenue : Double {
        return tablePrice*Double(numberOfTables)
    }
    
    var modelFestival : FestivalModel
    
    func nameChanged(name : String){
        if name != self.name {
            self.name = name
        }
    }
    
    func numberOfTablesChanged(number: Int) {
        if number != self.numberOfTables {
            self.numberOfTables = number
        }
    }
    
    func tablePriceChanged(price: Double) {
        if price != self.tablePrice {
            self.tablePrice = price
        }
    }
    
    init(festival : FestivalModel) {
        self.modelFestival = festival
        self.name = festival.name
        self.numberOfTables = festival.numberOfTables
        self.tablePrice = festival.tablePrice
        modelFestival.register(o: self)
    }
}
