//
//  Festival.swift
//  MVVM
//
//  Created by Valentin Racaud--Minuzzi on 20/02/2024.
//

import SwiftUI

protocol FestivalObservable {
    
    var observers : [FestivalObserver] {get set}
    
    func register( o : FestivalObserver)
    
    func notifyNameChanged(name : String)
    
    func notifyNumberChanged(number : Int)
    
    func notifyPriceChanged(price : Double)
    
    
    
}

class FestivalModel : FestivalObservable {
    
    var observers : [FestivalObserver]
    
    static var sqmTable : Double = 6.0
    public var name : String {
        didSet{
            if name != oldValue{
                self.notifyNameChanged(name: name)
            }
        }
    }
    
    var numberOfTables : Int = 64 {
        didSet{
            if numberOfTables != oldValue{
                self.notifyNumberChanged(number: numberOfTables)
            }
        }
    }
    
    var tablePrice : Double = 100.0 {
        didSet{
            if tablePrice != oldValue{
                self.notifyPriceChanged(price: tablePrice)
            }
        }
    }
    
    init(name: String, numberOfTables: Int = 64, tablePrice: Double = 110) {
        self.name = name
        self.numberOfTables = numberOfTables
        self.tablePrice = tablePrice
        self.observers = []
    }
    
    func register(o: FestivalObserver) {
        self.observers.append(o)
    }
    
    func notifyNameChanged( name : String ){
        for o in observers {
            print("change festival name of modelview to " + String(name))
            o.nameChanged(name: name)
        }
    }
    
    func notifyNumberChanged(number: Int) {
        for o in observers {
            print("change number of tables of modelview to " + String(number))
            o.numberOfTablesChanged(number: number)
        }
    }
    
    func notifyPriceChanged(price: Double) {
        for o in observers {
            print("change price of modelview to " + String(price))
            o.tablePriceChanged(price: price)
        }
    }
}
