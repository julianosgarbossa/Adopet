//
//  APLabelTextField.swift
//  Adopet
//
//  Created by Juliano Sgarbossa on 11/06/25.
//

import UIKit

class APLabelTextField: UIView {
    
    private var title: String
    private var placeholder: String
    private var isSecureEntry: Bool
    
    init(title: String, placeholder: String, isSecureEntry: Bool = false) {
        self.title = title
        self.placeholder = placeholder
        self.isSecureEntry = isSecureEntry
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    lazy var textField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.setLeftPaddingPoints(15)
        return txtField
    }()
    
    private func setupView() {
        self.updateUI()
        
        self.setVisualElements()
        
        self.setConstraints()
    }
    
    private func updateUI() {
        self.label.text = title
        self.textField.placeholder = placeholder
        self.textField.isSecureTextEntry = isSecureEntry
    }
    
    private func setVisualElements() {
        addSubview(label)
        addSubview(textField)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
