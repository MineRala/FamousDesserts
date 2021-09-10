//
//  AddDessertViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 31.08.2021.
//

import Foundation
import UIKit

class AddDessertViewController: UIViewController {
 
    var delegate: AddNewDessertDelegate!
    var addDessertViewModel: AddDessertViewModel!
    
    private let imagePickerController = UIImagePickerController()
    
    private lazy var dessertImage : UIImageView = {
        let dı = UIImageView(frame: .zero)
        dı.translatesAutoresizingMaskIntoConstraints = false
        dı.layer.cornerRadius = 16
        dı.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dessertImageTapped))
        dı.addGestureRecognizer(tap)
        dı.isUserInteractionEnabled = true
        return dı
    }()
    
    private lazy var dessertName: UITextField = {
        let dn = UITextField(frame: .zero)
        dn.placeholder = NSLocalizedString(C.Text.dessertName.rawValue, comment: "")
        dn.autocorrectionType = .no
        dn.autocapitalizationType = .sentences
        dn.translatesAutoresizingMaskIntoConstraints = false
        return dn
    }()
    
    private lazy var dessertCountry: UITextField = {
        let dc = UITextField(frame: .zero)
        dc.placeholder = NSLocalizedString(C.Text.dessertCountry.rawValue, comment: "")
        dc.autocorrectionType = .no
        dc.autocapitalizationType = .sentences
        dc.translatesAutoresizingMaskIntoConstraints = false
        return dc
    }()
    
    private lazy var dessertDescription: UITextView = {
        let dd = UITextView(frame: .zero)
        dd.isScrollEnabled = true
        dd.isEditable = true
        dd.autocorrectionType = .no
        dd.autocapitalizationType = .sentences
        dd.font = UIFont(name: C.commonFont, size: 24)
        dd.translatesAutoresizingMaskIntoConstraints = false
        return dd
    }()
    
    private lazy var dessertStar: UIButton = {
        let ds = UIButton(frame: .zero)
        ds.tintColor = C.Color.orangeColor
        ds.translatesAutoresizingMaskIntoConstraints = false
        return ds
    }()
    
    private lazy var dessertInfo: UIStackView = {
        let dı = UIStackView(frame: .zero)
        dı.axis = .horizontal
        dı.alignment = .fill
        dı.distribution = .equalSpacing
        dı.spacing = 24
        return dı
    }()
    
    private lazy var placeholdertText: UILabel = {
        let pt = UILabel(frame: .zero)
        pt.text = NSLocalizedString(C.Text.selectPhoto.rawValue, comment: "")
        pt.textColor = C.Color.blackColor
        pt.font = UIFont(name: C.commonFont, size: 16)
        pt.isUserInteractionEnabled = false
        return pt
    }()
    
    private lazy var addButton: UIButton = {
        let ab = UIButton(frame: .zero)
        ab.setTitle(NSLocalizedString(C.Text.add.rawValue, comment: ""), for: .normal)
        ab.setTitleColor(C.Color.blackColor, for: .normal)
        ab.layer.cornerRadius = 16
        ab.backgroundColor = C.Color.addButtonColor
        ab.titleLabel?.font = UIFont(name: C.commonFont, size: 16)
        ab.translatesAutoresizingMaskIntoConstraints = false
        return ab
    }()
    
    private lazy var removeImageButton: UIButton = {
        let rb = UIButton(frame: .zero)
        rb.setImage(UIImage(systemName: C.ImageIcon.multiplyCircle.rawValue), for: .normal)
        rb.tintColor = C.Color.blackColor
        rb.backgroundColor = C.Color.grayColor
        rb.isHidden = true
        rb.translatesAutoresizingMaskIntoConstraints = false
        return rb
    }()

    init(model: Dessert? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.addDessertViewModel = AddDessertViewModel(model: model)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Lifecycle
extension AddDessertViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        removeImageButton.layer.cornerRadius = removeImageButton.frame.height/2
        removeImageButton.layer.opacity = 0.5
    }
}
   
//MARK: - Set Up UI
extension AddDessertViewController: UITextViewDelegate{
    private func setUpUI() {
        super.view.backgroundColor = C.Color.whiteColor
   
        self.view.addSubview(dessertImage)
        dessertImage.backgroundColor = C.Color.dessertImageBackgroundColor
        dessertImage.topAnchor(margin: 0)
            .trailingAnchor(margin: 16)
            .heightAnchor(180)
        
        dessertImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        
        self.dessertImage.addSubview(placeholdertText)
        placeholdertText.centerXAnchor(margin: 0).centerYAnchor(margin: 0)
        
        self.dessertImage.addSubview(removeImageButton)
        removeImageButton.trailingAnchor(margin: 8).topAnchor(margin: 8).heightAnchor(32).widthAnchor(32)
        
        self.view.addSubview(dessertInfo)
        dessertInfo.addArrangedSubview(dessertName)
        dessertInfo.addArrangedSubview(dessertCountry)
        dessertInfo.addArrangedSubview(dessertStar)
        self.view.addSubview(dessertDescription)
        
        
        dessertInfo.topAnchor.constraint(equalTo: dessertImage.bottomAnchor, constant: 8).isActive = true
        dessertInfo.leadingAnchor(margin: 28).trailingAnchor(margin: 28).heightAnchor(64)
        
        dessertDescription
            .leadingAnchor(margin: 16)
            .trailingAnchor(margin: 16)
        dessertDescription.topAnchor.constraint(equalTo: dessertInfo.bottomAnchor, constant: 0).isActive = true
    
        self.view.addSubview(addButton)
        addButton.leadingAnchor(margin: 16)
            .trailingAnchor(margin: 16)
            .bottomAnchor(margin: 32)
            .heightAnchor(48)
        
        dessertDescription.bottomAnchor.constraint(equalTo: self.addButton.topAnchor, constant: -8).isActive = true
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        removeImageButton.addTarget(self, action: #selector(removeImageButtonTapped), for: .touchUpInside)
        
        //Sayfa açılırken textlere yapıştırıyor. Descriptionda placeholder kullanırsan descriptionu yapıştırmıyor.
        if addDessertViewModel.dessertState == .update {
            self.placeholdertText.isHidden = true
            
            if addDessertViewModel.dessert.imageData == nil{
                dessertImage.image = UIImage(named: addDessertViewModel.dessert.image)
            }else{
                dessertImage.image = UIImage(data: addDessertViewModel.dessert.imageData!)
            }
            
            dessertName.text = addDessertViewModel.dessert.name
            dessertCountry.text = addDessertViewModel.dessert.country
            dessertDescription.text = addDessertViewModel.dessert.description
            addButton.setTitle(NSLocalizedString(C.Text.update.rawValue, comment: ""), for: .normal)
        }
        // dessertState == .add olduğunda descriptionda placeholder görmek için yapıldı.
        else {
            dessertDescription.text = NSLocalizedString(C.Text.description.rawValue, comment: "")
            dessertDescription.delegate = self
            dessertDescription.textColor = C.Color.lightColor
        }
        
        if addDessertViewModel.dessert.isFavorite == true{
            dessertStar.setImage(UIImage(systemName: C.ImageIcon.starFill.rawValue), for: .normal)
        }else{
            dessertStar.setImage(UIImage(systemName: C.ImageIcon.star.rawValue), for: .normal)
        }
        
        dessertStar.addTarget(self, action: #selector(dessertStarTapped), for: .touchUpInside)
    }
}

//MARK: Description TextView Delegate
extension AddDessertViewController {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == C.Color.lightColor {
            textView.text = nil
            textView.textColor = C.Color.blackColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = NSLocalizedString(C.Text.description.rawValue, comment: "")
            textView.textColor = C.Color.lightColor
            }
    }
}

//MARK: - UIImagePicker Delegate
extension AddDessertViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("Selected source not available")
            return
        }
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image Not Found!")
            return
        }
        let oriantedImage = selectedImage.fixedOrientation()
        dessertImage.image = oriantedImage
        addDessertViewModel.dataOfSelectedImage = oriantedImage.pngData()
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Save Dessert
extension AddDessertViewController {
    private func saveNewDessert() {
        if addDessertViewModel.dessertState == .add {
            addDessertViewModel.dessert = Dessert()
            addDessertViewModel.dessert.id = UUID().uuidString
            addDessertViewModel.dessert.imageData = addDessertViewModel.dataOfSelectedImage
            addDessertViewModel.dessert.name = dessertName.text!
            addDessertViewModel.dessert.country = dessertCountry.text!
            addDessertViewModel.dessert.description = dessertDescription.text!
            addDessertViewModel.dessert.isFavorite = addDessertViewModel.stateFavorite
            self.delegate.passDessert(dessert: addDessertViewModel.dessert)
            self.dismiss(animated: true, completion: nil)
        }else {
            if addDessertViewModel.dataOfSelectedImage != nil {
                addDessertViewModel.dessert.imageData = addDessertViewModel.dataOfSelectedImage
                addDessertViewModel.dessert.image = ""
            }
            addDessertViewModel.dessert.name = dessertName.text!
            addDessertViewModel.dessert.country = dessertCountry.text!
            addDessertViewModel.dessert.description = dessertDescription.text!
            addDessertViewModel.dessert.isFavorite = addDessertViewModel.stateFavorite
            self.delegate.passDessert(dessert: addDessertViewModel.dessert)
            self.dismiss(animated: true, completion: nil)
        }
    }
}

//MARK: - Validate Dessert & Message
extension AddDessertViewController {
    private func validateDesserts () -> Bool {
        if dessertName.text?.count == 0 {
            return false
        }
        else if dessertCountry.text?.count == 0{
            return false
        }
        else if dessertDescription.text?.count == 0{
            return false
        }
        else if dessertImage.image == nil {
            return false
        }
        return true
    }

    private func inValidatedFieldsMessage() -> String {
        var str = ""
        if dessertImage.image == nil {
            str += NSLocalizedString(C.Text.noImageDessert.rawValue, comment: "")
        }
        if dessertName.text?.count == 0 {
            str += NSLocalizedString(C.Text.noDessertName.rawValue, comment: "")
        }
        if dessertCountry.text?.count == 0 {
            str += NSLocalizedString(C.Text.noDessertCountry.rawValue, comment: "")
        }
        if dessertDescription.text == NSLocalizedString(C.Text.description.rawValue, comment: "") || dessertDescription.text == ""{
            str += NSLocalizedString(C.Text.noDessertDescription.rawValue, comment: "")
        }
        return str
    }
}

//MARK: - Actions
extension AddDessertViewController {
    @objc func dessertImageTapped() {
        Alerts.showAlertImagePicker(controller: self, message: NSLocalizedString(C.Text.selectImageFrom.rawValue, comment: ""),
        openCameraButtonClicked: { 
            self.showImagePicker(selectedSource: .camera)
            self.placeholdertText.isHidden = true
            self.removeImageButton.isHidden = false
        }, openLibraryButtonClicked: {
            self.showImagePicker(selectedSource: .photoLibrary)
            self.placeholdertText.isHidden = true
            self.removeImageButton.isHidden = false
        })
    }
    
    @objc func addButtonTapped() {
        if dessertDescription.text == NSLocalizedString(C.Text.description.rawValue, comment: "") || dessertDescription.text == "" {
            Alerts.showAlertMissingText(controller: self, message: inValidatedFieldsMessage()) {}
            return
        }
        guard validateDesserts() == true else {
            Alerts.showAlertMissingText(controller: self, message: inValidatedFieldsMessage()) {}
            return
        }
        saveNewDessert()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func removeImageButtonTapped(){
        dessertImage.image = nil
        placeholdertText.isHidden = false
        removeImageButton.isHidden = true
    }

    @objc func endEditing() {
        self.dessertDescription.endEditing(true)
        self.dessertName.endEditing(true)
        self.dessertCountry.endEditing(true)
    }
    
    @objc func dessertStarTapped() {
        addDessertViewModel.stateFavorite.toggle()
        if addDessertViewModel.stateFavorite == true{
            dessertStar.setImage(UIImage(systemName: C.ImageIcon.starFill.rawValue), for: .normal)
        }else{
            dessertStar.setImage(UIImage(systemName: C.ImageIcon.star.rawValue), for: .normal)
        }
    }
}
