//
//  TextField.swift
//  BaseKit
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import UIKit

public class TextFieldModel {
    
    let placeholder: String
    let text: String?
    let textColor: UIColor
    let delegate: UITextFieldDelegate?
    
    
    public init(placeholder: String,
                text: String?,
                textColor: UIColor = .black,
                delegate: UITextFieldDelegate?) {
        self.placeholder = placeholder
        self.text = text
        self.textColor = textColor
        self.delegate = delegate
    }
    
    public func makeView() -> TextField {
        return TextField(viewModel: self)
    }
}

public class TextField: UIView {
    
    private let textField = UITextField()
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textField)
        textField.makePinToSuperviewConstraints().activate()
    }
    
    public required convenience init(viewModel: TextFieldModel) {
        self.init()
        
        configure(with: viewModel)
    }
    
    public func configure(with viewModel: TextFieldModel) {
        textField.placeholder = viewModel.placeholder
        textField.text = viewModel.text
        textField.delegate = viewModel.delegate
        textField.textColor = viewModel.textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



