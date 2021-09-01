//
//  HomeViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 29.08.2021.
//

import Foundation
import UIKit
import DeclarativeLayout
import DeclarativeTableView


class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating{
  
    private var arrDesserts: [Dessert] = []
    private var arrFiltered: [Dessert] = []
    
    private let searchController = UISearchController( searchResultsController: nil)
    
    private let dessertTableView :UITableView  = {
        let dtv = UITableView(frame: .zero, style: .plain)
        dtv.translatesAutoresizingMaskIntoConstraints = false
        return dtv
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        dessertTableView.separatorStyle = .none
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()




    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setUpUI() {
        
        configureNavigationBar()
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.addSubview(dessertTableView)
        dessertTableView.register(DessertCell.self, forCellReuseIdentifier: "DessertCell")
        
        dessertTableView
            .topAnchor(margin: 0)
            .bottomAnchor(margin: 0)
            .leadingAnchor(margin: 0)
            .trailingAnchor(margin: 0)
        
        dessertTableView.dataSource = self
        dessertTableView.delegate = self
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Dessert"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true

        arrDesserts = Dessert.all()
        arrFiltered = arrDesserts
        dessertTableView.reloadData()
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "DessertCell", for: indexPath) as! DessertCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let dessert = arrFiltered[indexPath.row]
        cell.updateCell(dessert: dessert)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailDessertViewController()
        let dessert = arrFiltered[indexPath.row
]
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "Desserts"
        let titleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let attributes = [NSAttributedString.Key.foregroundColor: titleColor , NSAttributedString.Key.font : UIFont(name:"Helvetica Neue Light", size: 24)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(addButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
     
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = self.searchController.searchBar.text else {
            return
        }
        
        if searchText.count == 0 || searchText == ""{
            arrFiltered = arrDesserts
        }
        else {
            arrFiltered = arrDesserts.filter({ (dessert) -> Bool in
                return dessert.name.lowercased().contains(searchText.lowercased()) || dessert.country.lowercased().contains(searchText.lowercased())
            })
        }
        self.dessertTableView.reloadData()
    }
    
    
    @objc func addButtonTapped(){
        print("tapped")
        let addVC = AddDessertViewController()
        self.navigationController?.isNavigationBarHidden = true 
        self.navigationController?.pushViewController(addVC, animated: true)
    }


}

