//
//  SignUpViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private var userManager = UserManager()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var img1: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var img2: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "paws"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.doesntHaveAnAccount
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorBlue")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nameInputField: APLabelTextField = {
        let inputField = APLabelTextField(title: Constants.nameLabelTitle, placeholder: Constants.nameTextFieldPlaceholder)
        return inputField
    }()
    
    private lazy var emailInputField: APLabelTextField = {
        let inputField = APLabelTextField(title: "Email", placeholder: "Escolha seu melhor email")
        inputField.textField.addTarget(self, action: #selector(txtFieldChanging(_:)), for: .editingChanged)
        inputField.textField.keyboardType = .emailAddress
        return inputField
    }()
    
    private lazy var phoneNumberInputField: APLabelTextField = {
        let inputField = APLabelTextField(title: "Telefone com DDD", placeholder: "Insira seu telefone/whatsapp")
        inputField.textField.keyboardType = .phonePad
        return inputField
    }()
    
    private lazy var passwordInputField: APLabelTextField = {
        let inputField = APLabelTextField(title: "Senha", placeholder: "Crie uma senha", isSecureEntry: true)
        return inputField
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameInputField, emailInputField, phoneNumberInputField, passwordInputField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = Constants.UIConstants.stackSpacing
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = UIColor(named: "ColorCoral")
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signUpButton), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
        ])
        contentView.addSubview(img1)
        contentView.addSubview(label)
        contentView.addSubview(stack)
        contentView.addSubview(button)
        contentView.addSubview(img2)
        
        NSLayoutConstraint.activate([
            
            img2.topAnchor.constraint(equalTo: contentView.topAnchor),
            img2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            img1.topAnchor.constraint(equalTo: contentView.topAnchor),
            img1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            img1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: -120),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64),
            
            stack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 88),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -88),
            button.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 32),
            button.heightAnchor.constraint(equalToConstant: 48),
            
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
        ])
    }
    
    @objc func signUpButton() {
        
        guard let name = nameInputField.textField.text,
              let email = emailInputField.textField.text,
              let phoneNumber = phoneNumberInputField.textField.text,
              let password = passwordInputField.textField.text else { return }
    
        let userData = CreateUserAccount(name: name, email: email, phoneNumber: phoneNumber, password: password)
        
        userManager.saveUser(userData: userData)
        
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    @objc func txtFieldChanging(_ textField: UITextField) {
        guard let txt = textField.text else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
            return
        }
        if txt.contains("@") {
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.layer.borderWidth = 0.0
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
        }
    }
}
