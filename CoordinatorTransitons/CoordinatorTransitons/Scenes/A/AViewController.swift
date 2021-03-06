//
//  AViewController.swift
//  CoordinatorTransitons
//
//  Created by Pavle Pesic on 5/18/18.
//  Copyright (c) 2018 Pavle Pesic. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AViewControllerProtocol: BaseViewControllerProtocol {
    var onGoToBWithFade: (() -> Void)? { get set }
}

class AViewController: UIViewController, AViewControllerProtocol {
    
    // MARK: - Vars & Lets
    
    var viewModel: AViewModelDelegate?
    
    // MARK: - AViewControllerProtocol
    
    var onGoToBWithFade: (() -> Void)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        self.viewModel = AViewModel()
    }
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func actionGoToBWithFade() {
        self.onGoToBWithFade?()
    }
    
}
