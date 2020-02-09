//
//  Button.swift
//  BaseKit
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import UIKit

class ButtonViewModel {
    let title: String
    let imageName: String?
    let didTap: () -> Void
    
    
    init(title: String,
         imageName: String? = nil,
         didTap: @escaping () -> Void) {
        self.title = title
        self.didTap = didTap
        self.imageName = imageName
    }
}

class Button: UIView {
    
    private let button = UIButton()
    private var tapHandler: () -> Void = { }
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(button)
        button.makePinToSuperviewConstraints().activate()
        
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    required convenience init(viewModel: ButtonViewModel) {
        self.init()
        
        configure(with: viewModel)
    }
    
    func configure(with viewModel: ButtonViewModel) {
        button.setTitle(viewModel.title, for: .normal)
        tapHandler = viewModel.didTap
        if let imageName = viewModel.imageName {
            button.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    
    @objc func handleTap() {
        tapHandler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

