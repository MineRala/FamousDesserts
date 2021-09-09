//
//  ImageDessertViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 6.09.2021.
//

import Foundation
import UIKit

enum PageBackground {
    case removeBackground
    case displayBackground
}

class ImageDessertViewController: UIViewController {
  
    var dessert = Dessert()
    var pageBackgroundMode: PageBackground = .displayBackground
    
    private lazy var dessertImage : UIImageView = {
        let dı = UIImageView(frame: .zero)
        dı.translatesAutoresizingMaskIntoConstraints = false
        return dı
    }()
}

//MARK: - Lifecycle
extension ImageDessertViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = true
        setUpUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewIsTapped))
        self.view.addGestureRecognizer(tap)
    }
}

//MARK: - Set Up UI
extension ImageDessertViewController {
    private func setUpUI() {
      self.view.addSubview(dessertImage)
//        let margins = self.view.layoutMargins
//        dessertImage.topAnchor(margin: margins.top)
//        dessertImage.centerXAnchor(margin: 0).widthAnchor(view.frame.width).centerYAnchor(margin: 0)
          dessertImage.centerXAnchor(margin: 0).centerYAnchor(margin: 0).heightAnchor(self.view.frame.height).widthAnchor(self.view.frame.width)
//        dessertImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -98).isActive = true
//        dessertImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    
    }
}

//MARK: - Set Image
extension ImageDessertViewController {
    func setImage(image: UIImage) {
        dessertImage.image = image
        dessertImage.contentMode = .scaleAspectFit
    }
}

//MARK: - Actions
extension ImageDessertViewController {
    @objc func viewIsTapped() {
        switch pageBackgroundMode {
        case .displayBackground:
            self.view.backgroundColor = UIColor.black
            self.view.isOpaque = false
            self.pageBackgroundMode = .removeBackground
            self.navigationController?.isNavigationBarHidden = true
        case .removeBackground:
            self.view.backgroundColor = UIColor.white
            self.view.isOpaque = true
            self.pageBackgroundMode = .displayBackground
            self.navigationController?.isNavigationBarHidden = false
        }
    }
}


