//
//  DessertCell.swift
//  FamousDesserts
//
//  Created by Mine Rala on 29.08.2021.
//

import Foundation
import UIKit
import DeclarativeLayout

class DessertCell: UITableViewCell {
    
    lazy var dessertImage : UIImageView = {
        let dı = UIImageView(frame: .zero)
        dı.translatesAutoresizingMaskIntoConstraints = false
        dı.layer.cornerRadius = 16
        dı.clipsToBounds = true
        return dı
    }()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        self.contentView.backgroundColor = .clear
      
        self.contentView.addSubview(dessertImage)
        dessertImage.topAnchor(margin: 16).leadingAnchor(margin: 16).trailingAnchor(margin: 16).heightAnchor(300)
        
        self.contentView.addSubview(dessertName)
        dessertName.centerXAnchor(margin: 0)
        dessertName.topAnchor.constraint(equalTo: dessertImage.bottomAnchor, constant: 16).isActive = true
        
        self.contentView.addSubview(dessertCountry)
        dessertCountry.centerXAnchor(margin: 0)
        dessertCountry.topAnchor.constraint(equalTo: dessertName.bottomAnchor, constant: 8).isActive = true
        dessertCountry.bottomAnchor(margin: 8)
        
    }
    
    func updateCell(dessert:Dessert) {
        if dessert.imageUrl != nil {
            let data =  NSData(contentsOf: dessert.imageUrl!)
            dessertImage.image = UIImage(data: data! as Data )
        }
        else {
            dessertImage.image = UIImage(named: dessert.image)
        }
        dessertName.text = dessert.name
        dessertCountry.text = dessert.country
       
    }
}
