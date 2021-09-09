//
//  DetailDessertViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 31.08.2021.
//

import Foundation
import UIKit
import DeclarativeLayout

class DetailDessertViewController: UIViewController {
    
    var detailDessertViewModel: DetailDessertViewModel!
    
    private lazy var dessertImage : UIImageView = {
        let dı = UIImageView(frame: .zero)
        dı.translatesAutoresizingMaskIntoConstraints = false
        dı.layer.cornerRadius = 16
        dı.clipsToBounds = true
        dı.isUserInteractionEnabled = true
        
        return dı
    }()
    
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
    
    private lazy var dessertStar: UIButton = {
        let ds = UIButton(frame: .zero)
        ds.tintColor = .orange
        ds.translatesAutoresizingMaskIntoConstraints = false
        ds.isEnabled = false
        return ds
    }()
    
    private lazy var dessertDescription: UITextView = {
        let dd = UITextView(frame: .zero)
        dd.isScrollEnabled = true
        dd.isEditable = false
        dd.font = UIFont(name:"Helvetica Neue Light", size: 24)
        dd.translatesAutoresizingMaskIntoConstraints = false
        return dd
    }()
    
    private lazy var dessertInfo: UIStackView = {
        let dı = UIStackView(frame: .zero)
        dı.axis = .horizontal
        dı.alignment = .fill
        dı.distribution = .equalSpacing
        dı.spacing = 24
        return dı
    }()
    
   init(model: Dessert) {
        super.init(nibName: nil, bundle: nil)
        self.detailDessertViewModel = DetailDessertViewModel(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Lifecycle
extension DetailDessertViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}

//MARK: - Set Up UI
extension DetailDessertViewController {
    private func setUpUI() {
        super.view.backgroundColor = .white

        self.view.addSubview(dessertImage)
        dessertImage.backgroundColor = .red
        dessertImage.topAnchor(margin: 0)
            .trailingAnchor(margin: 16)
            .heightAnchor(180)
        
        dessertImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        let topGesture = UITapGestureRecognizer(target: self, action: #selector(dessertImageTapped))
        dessertImage.addGestureRecognizer(topGesture)
        
        self.view.addSubview(dessertInfo)
        dessertInfo.addArrangedSubview(dessertName)
        dessertInfo.addArrangedSubview(dessertCountry)
        dessertInfo.addArrangedSubview(dessertStar)
        self.view.addSubview(dessertDescription)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor =  #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        dessertInfo.topAnchor.constraint(equalTo: dessertImage.bottomAnchor, constant: 8).isActive = true
        dessertInfo.leadingAnchor(margin: 28).trailingAnchor(margin: 28).heightAnchor(64)
        
        dessertDescription.bottomAnchor(margin: 16)
            .leadingAnchor(margin: 16)
            .trailingAnchor(margin: 16)
        dessertDescription.topAnchor.constraint(equalTo: dessertInfo.bottomAnchor, constant: 0).isActive = true
        dessertInfo.backgroundColor = .white
        dessertDescription.backgroundColor = .white
        
        if detailDessertViewModel.dessert.imageData != nil {
            dessertImage.image = UIImage(data: detailDessertViewModel.dessert.imageData!)
          
        }else{
            dessertImage.image = UIImage(named: detailDessertViewModel.dessert.image)
          
        }
        
        dessertName.text = detailDessertViewModel.dessert.name
        dessertCountry.text = detailDessertViewModel.dessert.country
        dessertDescription.text = detailDessertViewModel.dessert.description
        
        if detailDessertViewModel.dessert.isFavorite == true{
            dessertStar.setImage(UIImage(systemName: "star.fill"), for: .normal)
            
        }else{
            dessertStar.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
    }
}

//MARK: - Actions
extension DetailDessertViewController {
    @objc func dessertImageTapped() {
        let imageDessertVC = ImageDessertViewController()
        imageDessertVC.setImage(image: dessertImage.image!)
        self.navigationController?.pushViewController(imageDessertVC, animated: true)
    }

}
