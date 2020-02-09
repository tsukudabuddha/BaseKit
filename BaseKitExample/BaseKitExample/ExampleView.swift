//
//  ExampleView.swift
//  BaseKitExample
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import BaseKit
import UIKit


// TODO: Use StackViews and example view models
class ExampleView: UIView {
    let titleLabel: Label
    let button: Button
    let imageView: ImageView
    let textField: TextField
    
    init() {
        titleLabel = LabelViewModel(text: "Examples", textColor: .black, font: .boldSystemFont(ofSize: 28)).makeView()
        button = ButtonViewModel(title: "Click Me! And check output", didTap: { print("Clicked Button") }).makeView()
        imageView = ImageViewModel(imageName: "Left", contentMode: .scaleAspectFit).makeView()
        textField = TextFieldModel(placeholder: "Placeholder", text: nil, delegate: nil).makeView()
        super.init(frame: .zero)
        
        addSubviews([titleLabel, button, imageView, textField])
        installConstraints()
    }
    
    func installConstraints() {
        let views = [
            "title": titleLabel,
            "button": button,
            "imageView": imageView,
            "textField": textField
        ]
        
        NSLayoutConstraint.constraints(withVisualFormats: [
            "V:|-[title]-[button]-[imageView]-[textField]-(>=10)-|",
        ], options: .alignAllLeft, metrics: nil, views: views).activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
