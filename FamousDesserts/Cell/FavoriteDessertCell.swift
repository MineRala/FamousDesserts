//
//  FavoriteDessertCell.swift
//  FamousDesserts
//
//  Created by Mine Rala on 6.09.2021.
//

import Foundation
import UIKit

class FavoriteDessertCell: UITableViewCell {
    
    private lazy var dessertName: UILabel = {
        let dn = UILabel(frame: .zero)
        dn.translatesAutoresizingMaskIntoConstraints = false
        return dn
    }()
    
    private lazy var dessertCountry: UILabel = {
        let dc = UILabel(frame: .zero)
        dc.translatesAutoresizingMaskIntoConstraints = false
        return dc
    }()
    
    private lazy var infoDessert: UIStackView = {
        let id = UIStackView(frame: .zero)
        id.axis = .horizontal
        id.alignment = .firstBaseline
        id.distribution = .fillProportionally
        return id
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Set Up UI
extension FavoriteDessertCell {
    private func setUpUI(){
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(dessertName)
        self.contentView.addSubview(dessertCountry)
        
        dessertName.leadingAnchor(margin: 20).centerYAnchor(margin: 0)
        dessertName.widthAnchor.constraint(equalToConstant: self.frame.width/2).isActive = true
        dessertCountry.trailingAnchor(margin: 20).centerYAnchor(margin: 0)
        dessertCountry.widthAnchor(100)
    }
}

//MARK: - Update Cell
extension FavoriteDessertCell {
    func updateCell(dessert:Dessert) {
        dessertName.text = dessert.name
        dessertCountry.text = dessert.country
    }
}
