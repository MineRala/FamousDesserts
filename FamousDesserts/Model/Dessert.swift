//
//  Dessert.swift
//  FamousDesserts
//
//  Created by Mine Rala on 30.08.2021.
//

import Foundation

class Dessert {
    var image: String = ""
    var name: String = ""
    var country: String = ""
    var description:String = ""
    var isFavorite: Bool = false
    var id: String = ""
    var imageData: Data? = nil
    
    static func all() -> [Dessert] {
        
        var arrDesserts: [Dessert]  = []
        var dessert: Dessert
        
        dessert = Dessert()
        dessert.name = "Crème Brûlée"
        dessert.country = "France"
        dessert.description = "Crème brûlée is a favorite dessert all over France. It contains rich, creamy custard topped with a layer of hard, crunchy caramel that is just slightly browned."
        dessert.isFavorite = true
        dessert.id = "Crème Brûlée"
        dessert.image = "france-crme-brle"
        arrDesserts.append(dessert)
        
        dessert = Dessert()
        dessert.name = "Apple Pie"
        dessert.country = "America"
        dessert.description = "It doesn't get any more American than apple pie. The pie — consisting of apple pieces wrapped in a flaky crust — can be served with whipped cream, vanilla ice cream, or even cheddar cheese."
        dessert.isFavorite = false
        dessert.id = "Apple Pie"
        dessert.image = "applePie"
        arrDesserts.append(dessert)
        
        dessert = Dessert()
        dessert.name = "Baklava"
        dessert.country = "Turkey"
        dessert.description = "One of Turkey's specialties, baklava, consists of phyllo dough layered between a mixture of chopped nuts. The squares are held together by syrup or honey."
        dessert.isFavorite = true
        dessert.id = "Baklava"
        dessert.image = "baklava"
        arrDesserts.append(dessert)
        
        dessert = Dessert()
        dessert.name = "Galeto"
        dessert.country = "Italy"
        dessert.description = "The streets of Italy are lined with restaurants selling gelato, an Italian version of ice cream that is more like soft-serve than traditional American ice cream. Gelato comes in a wide variety of flavors, including raspberry, pistachio, rum, and chocolate."
        dessert.isFavorite = false
        dessert.id = "Galeto"
        dessert.image = "galeto"
        arrDesserts.append(dessert)
        
        dessert = Dessert()
        dessert.name = "Picarones"
        dessert.country = "Peru"
        dessert.description = "Picarones are a Peruvian doughnut. They're made by deep frying a combination of sweet potato, squash, flour, yeast, sugar, and anise."
        dessert.isFavorite = false
        dessert.id = "Picarones"
        dessert.image = "picarones"
        arrDesserts.append(dessert)
        
        dessert = Dessert()
        dessert.name = "Syrniki"
        dessert.country = "Russia"
        dessert.description = "Russians are particularly fond of syrniki, a pancake that is made out of quark — a fresh dairy product made from cheese that has a texture similar to sour cream. The pancakes are then fried and served with jam, apple sauce, sour cream, or honey."
        dessert.isFavorite = false
        dessert.id = "Syrniki"
        dessert.image = "syrniki"
        arrDesserts.append(dessert)
        
        dessert = Dessert()
        dessert.name = "Tarta de Santiago"
        dessert.country = "Spain"
        dessert.description = "Tarta de Santiago is Spanish for cake of Saint James. The almond cake has a rich history: It originated in the Middle Ages in Galicia, a region in the northwest of Spain."
        dessert.isFavorite = false
        dessert.id = "Tarta"
        dessert.image = "tarta"
        arrDesserts.append(dessert)
        
        dessert = Dessert()
        dessert.name = "Mochi"
        dessert.country = "Japan"
        dessert.description = "Japanese mochi gets its name from mochigome, a glutinous rice that is pounded into a paste and molded into a circular shape. Mochi is available year-round, but it is most often eaten and sold at Japanese New Year. It is often wrapped around a small scoop of ice cream."
        dessert.isFavorite = false
        dessert.id = "Mochi"
        dessert.image = "mochi"
        arrDesserts.append(dessert)
        
        return arrDesserts
        
         
    }
}
