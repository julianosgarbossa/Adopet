//
//  TableHeaderView.swift
//  Adopet
//
//  Created by Giovanna Moeller on 20/02/24.
//

import UIKit

class TableHeaderView: UIView {
    
    private lazy var text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá! Veja os amigos disponíveis para adoção!"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorBlue")
        return label
    }()
    
    private lazy var img1: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(img1)
        addSubview(text)
        
        NSLayoutConstraint.activate([
            img1.topAnchor.constraint(equalTo: topAnchor),
            img1.leadingAnchor.constraint(equalTo: leadingAnchor),
            img1.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            text.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
