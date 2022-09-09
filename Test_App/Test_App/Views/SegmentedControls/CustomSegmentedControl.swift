//
//  CustomSegmentedControl.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-31.
//

import UIKit

class CustomSegmentedControl: UIView {

    private var buttonTitles: [String]!
    private var buttons: [UIButton] = []
    private var selectorView: UIView!
    
    var textColor: UIColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
    var selectorViewColor: UIColor = UIColor(named: "MyOrange")!
    var selectedTextColor: UIColor = UIColor(named: "MyBlackBlue")!
    
    convenience init(frame:CGRect,buttonTitle:[String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.white
        updateView()
    }
    
    func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        updateView()
    }
    
    private func configureStackVIew() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        
        selectorView = UIView(frame: CGRect(x: 0,
                                            y: self.frame.height,
                                            width: selectorWidth,
                                            height: 3))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectedTextColor, for: .normal)
        
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width/CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectedTextColor, for: .normal)
            }
        }
    }
    
    private func updateView() {
        createButton()
        configureSelectorView()
        configureStackVIew()
    }
}
