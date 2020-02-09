//
//  Button.swift
//  BaseKit
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import UIKit

public class ButtonViewModel {
    let title: String
    let textColor: UIColor
    let imageName: String?
    let didTap: () -> Void
    
    
    public init(title: String,
                textColor: UIColor = .black,
                imageName: String? = nil,
                didTap: @escaping () -> Void) {
        self.title = title
        self.textColor = textColor
        self.didTap = didTap
        self.imageName = imageName
    }
    
    public func makeView() -> Button {
        return Button(viewModel: self)
    }
}

public class Button: UIView {
    
    private let button = UIButton()
    private var tapHandler: () -> Void = { }
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(button)
        button.makePinToSuperviewConstraints().activate()
        
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    public required convenience init(viewModel: ButtonViewModel) {
        self.init()
        
        configure(with: viewModel)
    }
    
    public func configure(with viewModel: ButtonViewModel) {
        button.setTitle(viewModel.title, for: .normal)
        button.setTitleColor(viewModel.textColor, for: .normal)
        tapHandler = viewModel.didTap
        if let imageName = viewModel.imageName {
            button.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    
    @objc func handleTap() {
        tapHandler()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

