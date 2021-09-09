//
//  HomeViewModel.swift
//  FamousDesserts
//
//  Created by Mine Rala on 4.09.2021.
//

import Foundation

class HomeViewModel {
    
    var arrDesserts: [Dessert] = []
    var arrFilteredDesserts: [Dessert] = []
    
    func initializeArrays() {
        arrDesserts = Dessert.all()
        arrFilteredDesserts = arrDesserts
    }

    func updateFilteredArray(with searchText: String) {
        if searchText.count == 0 || searchText == ""{
            self.arrFilteredDesserts = arrDesserts
        }
        else {
            arrFilteredDesserts = arrDesserts.filter({ (dessert) -> Bool in
                return dessert.name.lowercased().contains(searchText.lowercased()) || dessert.country.lowercased().contains(searchText.lowercased())
            })
        }
    }
    
    func removeItemFromArrayDessert(index: Int) {
        self.arrDesserts.remove(at: index)
        self.arrFilteredDesserts = self.arrDesserts
    }
    
    func checkDessert(dessert: Dessert) {
        // Pass edilen tatlı var mı diye tatlıların id'sini karşılaştırıyor.
        let index = arrDesserts.firstIndex { ds -> Bool in
            return ds.id == dessert.id
        }
        //update durumu
        if let currentIndex = index {
            arrDesserts.remove(at: currentIndex)
            arrDesserts.insert(dessert, at: currentIndex)
        } else {
            arrDesserts.append(dessert)
        }
    }
}
