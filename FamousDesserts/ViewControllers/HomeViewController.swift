//
//  HomeViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 29.08.2021.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private let dessertTableVieW :UITableView  = {
        let dtv = UITableView(frame: .zero, style: .plain)
        return dtv
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
