//
//  FavoriViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 5.09.2021.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var arrFovorited : [Dessert] = []
    var homeViewModel = HomeViewModel()
    
    private lazy var favoriteDessertTableView: UITableView  = {
        let fdtv = UITableView(frame: .zero, style: .plain)
        //fdtv.separatorStyle = .none
        fdtv.translatesAutoresizingMaskIntoConstraints = false
        return fdtv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .white
        self.title = "Favorite Desserts"
        self.view.addSubview(favoriteDessertTableView)
        favoriteDessertTableView.register(FavoriteDessertCell.self, forCellReuseIdentifier: "FavoriteDessertCell")
        favoriteDessertTableView
            .topAnchor(margin: 0)
            .bottomAnchor(margin: 0)
            .trailingAnchor(margin: 0)
            .leadingAnchor(margin: 0)
        
        for item in homeViewModel.arrFilteredDesserts{
            if item.isFavorite == true {
                arrFovorited.append(item)
            }
        }
        
        favoriteDessertTableView.dataSource = self
        favoriteDessertTableView.delegate = self
        favoriteDessertTableView.reloadData()
        
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFovorited.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "FavoriteDessertCell", for: indexPath) as! FavoriteDessertCell
      //  cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let dessert = arrFovorited[indexPath.row]
        cell.updateCell(dessert: dessert)
        return cell
    }
    
}
