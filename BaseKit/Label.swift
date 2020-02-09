//
//  Label.swift
//  BaseKit
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import UIKit

class LabelViewModel {
    
    let text: String
    let textColor: UIColor
    let font: UIFont
    
    
    init(text: String,
         textColor: UIColor,
         font: UIFont) {
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}

class Label: UIView {
    
    private let label = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        label.makePinToSuperviewConstraints().activate()
    }
    
    required convenience init(viewModel: LabelViewModel) {
        self.init()
        
        configure(with: viewModel)
    }
    
    func configure(with viewModel: LabelViewModel) {
        label.text = viewModel.text
        label.textColor = viewModel.textColor
        label.font = viewModel.font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


