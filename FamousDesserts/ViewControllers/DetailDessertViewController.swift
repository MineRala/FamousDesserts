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
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
 
    lazy var backButton: UIButton = {
        let bb = UIButton(frame: .zero)
        let boldFont = UIFont.boldSystemFont(ofSize: 24)
        let configuration = UIImage.SymbolConfiguration(font: boldFont)
        bb.setImage(UIImage(systemName:"arrow.backward.circle", withConfiguration: configuration), for: .normal)
        bb.tintColor = .black
        bb.translatesAutoresizingMaskIntoConstraints = false
        return bb
    }()
    
    private func setUpUI() {
        super.view.backgroundColor = .white
        self.view.addSubview(backButton)
        backButton.topAnchor(margin: 50)
            .leadingAnchor(margin: 4)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
