//
//  AddDessertViewModel.swift
//  FamousDesserts
//
//  Created by Mine Rala on 4.09.2021.
//

import Foundation

protocol AddNewDessertDelegate {
    func passDessert(dessert: Dessert)
}

enum AddDessertViewControllerState{
    case add
    case update
}

class AddDessertViewModel {
    
    var dessert: Dessert
    var dessertState = AddDessertViewControllerState.add
    var dataOfSelectedImage: Data!
    var stateFavori: Bool = false
    
    
    init(model: Dessert? = nil ) {
        if model != nil {
            self.dessert = model!
        }else{
            dessert = Dessert()
        }
    }
    
}
