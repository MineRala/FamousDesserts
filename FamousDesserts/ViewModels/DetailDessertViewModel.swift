//
//  DetailDessertViewModel.swift
//  FamousDesserts
//
//  Created by Mine Rala on 4.09.2021.
//

import Foundation


protocol ImageProtocol {
    func image(dessert: Dessert)
}

class DetailDessertViewModel {
    
    var dessert : Dessert
    
    init(model: Dessert) {
        self.dessert = model
    }
}
