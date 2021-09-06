//
//  FavoriteDessertCell.swift
//  FamousDesserts
//
//  Created by Mine Rala on 6.09.2021.
//

import Foundation
import UIKit

class FavoriteDessertCell: UITableViewCell {
    
    lazy var dessertName: UILabel = {
        let dn = UILabel(frame: .zero)
        dn.translatesAutoresizingMaskIntoConstraints = false
        return dn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        self.contentView.backgroundColor = .orange
       
        self.contentView.addSubview(dessertName)
        dessertName.centerXAnchor(margin: 0).centerYAnchor(margin: 0)
        
    }
    
    func updateCell(dessert:Dessert) {
        dessertName.text = dessert.name
       
    }
}
