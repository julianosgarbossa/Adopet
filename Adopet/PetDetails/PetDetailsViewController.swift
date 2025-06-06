//
//  PetDetailsViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class PetDetailsViewController: UIViewController {
    
    private var pet: Pet
    private var dataManager = DataManager()
    
    private lazy var img1: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Saiba mais sobre \(pet.name)"
        label.font = .init(name: "Poppins-Bold", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorBlue")
        return label
    }()
    
    private lazy var img2: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var descricao: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(pet.age)\n\(pet.size)\n\(pet.behavior)"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var location: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = pet.location
        label.font = .init(name: "Poppins-Bold", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var callbutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ligar para responsável", for: .normal)
        button.backgroundColor = UIColor(named: "ColorCoral")
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(call), for: .touchUpInside)
        return button
    }()
    
    private lazy var wppButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Chamar no Whatsapp", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor(named: "ColorCoral")?.cgColor
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.setTitleColor(UIColor(named: "ColorCoral"), for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(sendWpp), for: .touchUpInside)
        return button
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [text, img2, descricao, location, callbutton, wppButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 24
        stack.axis = .vertical
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(img1)
        view.addSubview(stack)
        
        dataManager.downloadPetImage(from: pet.imageUrl) { image in
            DispatchQueue.main.async {
                guard let image else { return }
                self.img2.image = image
            }
        }
        
        NSLayoutConstraint.activate([
            
            img1.topAnchor.constraint(equalTo: view.topAnchor),
            img1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            img1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stack.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: -120),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            img2.heightAnchor.constraint(equalToConstant: 172),
            callbutton.heightAnchor.constraint(equalToConstant: 48),
            wppButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
    init(pet: Pet) {
        self.pet = pet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func call() {
        if let url = URL(string: "tel://\(pet.phoneNumber)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func sendWpp() {
        if let whatsapp = URL(string: "whatsapp://send?phone=\(pet.phoneNumber)&text=Olá! Tenho interesse no pet \(pet.name)") {
            if UIApplication.shared.canOpenURL(whatsapp) {
                UIApplication.shared.open(whatsapp, options: [:], completionHandler: nil)
            } else {
                if let appstore = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") {
                    UIApplication.shared.open(appstore, options: [:], completionHandler: nil)
                }
            }
        }
    }
}
