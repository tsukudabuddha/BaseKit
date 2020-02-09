//
//  Label.swift
//  BaseKit
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import UIKit

public class LabelViewModel {
    
    let text: String
    let textColor: UIColor
    let font: UIFont
    
    
    public init(text: String,
         textColor: UIColor,
         font: UIFont) {
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}

public class Label: UIView {
    
    private let label = UILabel()
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        label.makePinToSuperviewConstraints().activate()
    }
    
    public required convenience init(viewModel: LabelViewModel) {
        self.init()
        
        configure(with: viewModel)
    }
    
    public func configure(with viewModel: LabelViewModel) {
        label.text = viewModel.text
        label.textColor = viewModel.textColor
        label.font = viewModel.font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


