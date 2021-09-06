//
//  ImageDessertViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 6.09.2021.
//

import Foundation
import UIKit


class ImageDessertViewController: UIViewController {
  
    var dessert = Dessert()
    
    lazy var dessertImage : UIImageView = {
        let dı = UIImageView(frame: .zero)
        dı.translatesAutoresizingMaskIntoConstraints = false
        dı.backgroundColor = .clear
        return dı
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    
    private func setUpUI() {
        self.view.backgroundColor = .white
        
        self.navigationItem.backBarButtonItem?.tintColor =  #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        self.view.addSubview(dessertImage)
        dessertImage.centerXAnchor(margin: 0).centerYAnchor(margin: 0).heightAnchor(view.frame.height*0.6).widthAnchor(view.frame.width)
        
        dessertImage.image = UIImage(named: dessert.image)
        
    }
    
    
}
