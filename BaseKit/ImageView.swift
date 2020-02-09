//
//  ImageView.swift
//  BaseKit
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import UIKit

public class ImageViewModel {
    
    let imageName: String
    let contentMode: UIView.ContentMode
    
    
    public init(imageName: String,
                contentMode: UIView.ContentMode) {
        self.imageName = imageName
        self.contentMode = contentMode
    }
    
    public func makeView() -> ImageView {
        return ImageView(viewModel: self)
    }
}

public class ImageView: UIView {
    
    private let imageView = UIImageView()
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        imageView.makePinToSuperviewConstraints().activate()
    }
    
    public required convenience init(viewModel: ImageViewModel) {
        self.init()
        
        configure(with: viewModel)
    }
    
    public func configure(with viewModel: ImageViewModel) {
        imageView.contentMode = viewModel.contentMode
        imageView.image = UIImage(named: viewModel.imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



