//
//  Dessert.swift
//  FamousDesserts
//
//  Created by Mine Rala on 30.08.2021.
//

import Foundation
import UIKit

class Dessert {
    
    var image: UIImage!
    var name: String = ""
    var country: String = ""
    var description:String = ""
    var isFavorite: Bool = false
    var id: String = ""
    
    
    static func all() -> [Dessert] {
        
        var arrDesserts: [Dessert]  = []
        var dessert: Dessert
        
        dessert = Dessert()
        
        dessert.name = "Crème Brûlée"
        dessert.country = "France"
        dessert.description = "Crème brûlée is a favorite dessert all over France. It contains rich, creamy custard topped with a layer of hard, crunchy caramel that is just slightly browned."
        dessert.isFavorite = false
        dessert.id = "Crème Brûlée"
        dessert.image = UIImage(named: "france-crme-brle")
        
        arrDesserts.append(dessert)
        
        dessert = Dessert()
        dessert.name = "Apple Pie"
        dessert.country = "America"
        dessert.description = "It doesn't get any more American than apple pie. The pie — consisting of apple pieces wrapped in a flaky crust — can be served with whipped cream, vanilla ice cream, or even cheddar cheese."
        dessert.isFavorite = false
        dessert.id = "Apple Pie"
        dessert.image = UIImage(named: "applePie")
        
        arrDesserts.append(dessert)
        
        return arrDesserts
    }
}
