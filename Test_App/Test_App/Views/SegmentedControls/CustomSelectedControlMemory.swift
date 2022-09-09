//
//  CustomSelectedControlMemory.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-31.
//

import UIKit

class CustomSelectedControlMemory: UIView {

    private var buttonTitles: [UILabel]!
    private var buttons: [UIButton] = []
    
    var textColor: UIColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
    var selectorViewColor: UIColor = UIColor(named: "MyOrange")!
    var selectedTextColor: UIColor = .white
    
    convenience init(frame:CGRect,buttonTitle:[UILabel]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    func setButtonTitles(buttonTitles: [UILabel]) {
        self.buttonTitles = buttonTitles
        updateView()
    }
    
    private func configureStackVIew() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 21
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
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle.text, for: .normal)
            button.addTarget(self, action: #selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        
        for (buttonIndex, _) in buttons.enumerated() {
            buttons[buttonIndex].setTitleColor(selectedTextColor, for: .normal)
            buttons[buttonIndex].backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            buttons[buttonIndex].layer.cornerRadius = 8
        }
        
        buttons[0].backgroundColor = UIColor(named: "MyOrange")!
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            btn.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            if btn == sender {
                btn.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
                UIView.animate(withDuration: 0.3) {
                    self.buttons[buttonIndex].backgroundColor = self.selectorViewColor
                }
                
                btn.setTitleColor(selectedTextColor, for: .normal)
            }
        }
    }
    
    private func updateView() {
        createButton()
        configureStackVIew()
    }
}
