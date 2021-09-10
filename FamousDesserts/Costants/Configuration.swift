//
//  Constant.swift
//  FamousDesserts
//
//  Created by Mine Rala on 9.09.2021.
//

import Foundation
import UIKit

struct C {
    static var commonFont : String = "Helvetica Neue Light"
    
    struct Color {
        static var clearColor: UIColor {UIColor.clear}
        static var whiteColor: UIColor {UIColor.white}
        static var blackColor: UIColor {UIColor.black}
        static var backButtonColor: UIColor {#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)}
        static var rightButtonColor: UIColor {#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)}
        static var addButtonColor: UIColor {#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)}
        static var orangeColor: UIColor {UIColor.orange}
        static var redColor: UIColor {UIColor.red}
        static var grayColor: UIColor {UIColor.systemGray5}
        static var dessertImageBackgroundColor: UIColor {#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)}
        static var lightColor: UIColor {UIColor.lightGray}
    }
    
    enum Text: String {
        case emptyList = "Empty List"
        case selectPhoto = "Select Photo"
        case add = "Add"
        case update = "Update"
        case dessertName = "Dessert Name"
        case dessertCountry = "Dessert Country"
        case dessertDescription = "Dessert Description"
        case searchDessert = "Search Dessert"
        case desserts = "Desserts"
        case delete = "Delete"
        case showAlertDeleteMessage = "Are you sure you want to delete this dessert?"
        case description = "Description"
        case selectImageFrom = "Select Image From"
        case noImageDessert = "You must choose photo."
        case noDessertName = "You must enter dessert name."
        case noDessertCountry = "You must enter dessert country."
        case noDessertDescription = "You must enter dessert description."
        case favoriteDessert = "Favorite Desserts"
        case deletionConfirmation = "Deletion Confirmation"
        case cancel = "Cancel"
        case library = "Library"
        case missingArgument = "Missing Argument"
        case okey = "Okey"
        case camera = "Camera"
    }

    enum ImageIcon: String {
        case star = "star"
        case starFill = "star.fill"
        case multiplyCircle = "multiply.circle"

    }
}
