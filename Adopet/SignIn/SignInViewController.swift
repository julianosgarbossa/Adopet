//
//  SignInViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 12/02/24.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var paws: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "paws"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    private lazy var shape: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var shape2: UIImageView = {
        let image = UIImage(named: "shape-2")?.withHorizontallyFlippedOrientation()
        let imgView = UIImageView(image: image)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var logo: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "logo-blue"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Já tem conta? Faça seu login:"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorBlue")
        return label
    }()
    
    private lazy var email: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var emailTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Insira seu email"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.textAlignment = .center
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        return txtField
    }()
    
    private lazy var password: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var passwordTxtField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Crie uma senha"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.textAlignment = .center
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.rightViewMode = .always
        return txtField
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [email, emailTxtField, password, passwordTxtField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 16
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = UIColor(named: "ColorCoral")
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        view.addSubview(shape)
        view.addSubview(shape2)
        view.addSubview(paws)
        view.addSubview(logo)
        view.addSubview(text)
        view.addSubview(stack)
        view.addSubview(button)
        // Do any additional setup after loading the view.
        
        NSLayoutConstraint.activate([
            shape2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: shape.bottomAnchor, constant: -108),
            
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            text.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 32),
            
            paws.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stack.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 32),
            
            emailTxtField.heightAnchor.constraint(equalToConstant: 48),
            passwordTxtField.heightAnchor.constraint(equalToConstant: 48),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88),
            button.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 32),
            button.heightAnchor.constraint(equalToConstant: 48),


        ])
    }
    
    @objc func signIn() {
        let email = emailTxtField.text!
        let password = passwordTxtField.text!
        
        navigationController?.pushViewController(PetsListViewController(), animated: true)
    }
}
