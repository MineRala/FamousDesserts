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
    
    private let dessertImage : UIImageView = {
        let dı = UIImageView(frame: .zero)
        return dı
    }()
    
    private let dessertName: UILabel = {
        let dn = UILabel(frame: .zero)
        return dn
    }()
    
    private let dessertCountry: UILabel = {
        let dc = UILabel(frame: .zero)
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
        self.contentView.backgroundColor = .blue
    }
}
