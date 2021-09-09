//
//  FavoriViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 5.09.2021.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var arrFavorited : [Dessert] = []
    var homeViewModel: HomeViewModel!
    
    private lazy var favoriteDessertTableView: UITableView  = {
        let fdtv = UITableView(frame: .zero, style: .plain)
        fdtv.translatesAutoresizingMaskIntoConstraints = false
        return fdtv
    }()
    
    init(model: HomeViewModel? = nil) {
        super.init(nibName: nil, bundle: nil)
        if model == nil {
            self.homeViewModel = HomeViewModel()
        }else{
            self.homeViewModel = model
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
       
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .white
        self.title = "Favorite Desserts"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor =  #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        self.view.addSubview(favoriteDessertTableView)
        favoriteDessertTableView.register(FavoriteDessertCell.self, forCellReuseIdentifier: "FavoriteDessertCell")
        favoriteDessertTableView
            .topAnchor(margin: 0)
            .bottomAnchor(margin: 0)
            .trailingAnchor(margin: 0)
            .leadingAnchor(margin: 0)
        favoriteDessertTableView.tableFooterView = UIView()
        
        
        favoriteDessertTableView.dataSource = self
        favoriteDessertTableView.delegate = self
        
        for item in homeViewModel.arrFilteredDesserts{
            if item.isFavorite == true {
                arrFavorited.append(item)
            }
        }
        
        favoriteDessertTableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFavorited.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "FavoriteDessertCell", for: indexPath) as! FavoriteDessertCell
        let dessert = arrFavorited[indexPath.row]
        // Cell selection color changed.
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        cell.updateCell(dessert: dessert)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true) // celli seçtikten sonraki griliği kaldırır.
        let dessert = homeViewModel.arrFilteredDesserts[indexPath.row]
        let detailVC = DetailDessertViewController(model: dessert)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}
