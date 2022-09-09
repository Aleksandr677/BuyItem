//
//  CustomSegmentedControlColor.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-31.
//

import UIKit

class CustomSegmentedControlColor: UIView {

    private var buttonColors: [UIColor]!
    private var buttons: [UIButton] = []
    
    convenience init(frame:CGRect,buttonColor:[UIColor]) {
        self.init(frame: frame)
        self.buttonColors = buttonColor
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    func setButtonTitles(buttonColors: [UIColor]) {
        self.buttonColors = buttonColors
        updateView()
    }
    
    private func configureStackVIew() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 9
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        
        for buttonColor in buttonColors {
            let button = UIButton(type: .system)
            button.backgroundColor = buttonColor
            button.addTarget(self, action: #selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        for (buttonIndex, _) in buttons.enumerated() {
            buttons[buttonIndex].layer.cornerRadius = 20
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setImage(nil, for: .normal)
            if btn == sender {
                buttons[buttonIndex].setImage(UIImage(named: "ic-checkMark"), for: .normal)
            }
        }
    }
    
    private func updateView() {
        createButton()
        configureStackVIew()
    }

}
