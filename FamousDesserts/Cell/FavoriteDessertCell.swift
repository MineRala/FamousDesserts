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
    
    lazy var dessertCountry: UILabel = {
        let dc = UILabel(frame: .zero)
        dc.translatesAutoresizingMaskIntoConstraints = false
        return dc
    }()
    
    lazy var infoDessert: UIStackView = {
        let id = UIStackView(frame: .zero)
        id.axis = .horizontal
        id.alignment = .firstBaseline
        id.distribution = .fillProportionally
        id.spacing = 0
        return id
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        self.contentView.backgroundColor = .clear
       
        
        self.contentView.addSubview(infoDessert)
        infoDessert.addArrangedSubview(dessertName)
        infoDessert.addArrangedSubview(dessertCountry)
        infoDessert.trailingAnchor(margin: 20).centerYAnchor(margin: 0).leadingAnchor(margin: 20)
        
    }
    
    func updateCell(dessert:Dessert) {
        dessertName.text = dessert.name
        dessertCountry.text = dessert.country
       
    }
}
