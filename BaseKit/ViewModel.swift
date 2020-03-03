//
//  ViewModel.swift
//  BaseKit
//
//  Created by Andrew Tsukuda on 3/2/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import UIKit

protocol ViewModel {
    associatedtype V: ViewModelConfigurable
    
    func makeView() -> V
}

protocol ViewModelConfigurable {
    associatedtype VM: ViewModel
    
    func configure(with: VM)
}
