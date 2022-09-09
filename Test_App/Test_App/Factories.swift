//
//  Factories.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-22.
//

import UIKit

// MARK: - Labels
func makeLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = text

    return label
}

// MARK: - Buttons
func makeButton(withImage name: String) -> UIButton {
    let button = UIButton()
    button.setImage(UIImage(named: name), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.isUserInteractionEnabled = true
    button.isEnabled = true
    button.tag = 0
    return button
}

// MARK: - TextField
func makeTextField(withPlaceholderText placeHolderText: String) -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeHolderText
    textField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.0, green: 0.0, blue: 0.21, alpha: 0.5)])
    textField.textColor = UIColor(named: "MyBlackBlue")
    textField.font = UIFont(name: "Mark Pro Regular", size: 10)

    return textField
}

// MARK: - StackView
func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    
    stackView.alignment = .fill
    stackView.distribution = .fill

    return stackView
}

// MARK: - View
func makeView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.frame = CGRect(x: 0, y: 0, width: 71, height: 71)
    view.backgroundColor = UIColor(named: "MyOrange")
    return view
}

// MARK: - ScrollView
func makeScrollView() -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.alwaysBounceVertical = true
    scrollView.alwaysBounceHorizontal = false
    scrollView.showsVerticalScrollIndicator = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    
    return scrollView
}

//MARK: - ImageView
func makeImageView(with imageName: String) -> UIImageView {
    let image = UIImage(named: imageName)
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}
