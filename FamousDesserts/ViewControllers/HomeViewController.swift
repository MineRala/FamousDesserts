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


class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    private let dessertTableView :UITableView  = {
        let dtv = UITableView(frame: .zero, style: .plain)
        return dtv
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        self.view.addSubview(dessertTableView)
        dessertTableView.register(DessertCell.self, forCellReuseIdentifier: "DessertCell")
        
        
        dessertTableView
            .topAnchor(margin: 0)
            .bottomAnchor(margin: 0)
            .leadingAnchor(margin: 0)
            .trailingAnchor(margin: 0)
        
        dessertTableView.dataSource = self
        dessertTableView.delegate = self
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "DessertCell", for: indexPath) as! DessertCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
