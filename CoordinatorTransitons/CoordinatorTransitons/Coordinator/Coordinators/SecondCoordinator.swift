//
//  SecondCoordinator.swift
//  CoordinatorTransitons
//
//  Created by Pavle Pesic on 5/18/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import UIKit

final class SecondCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol

    // MARK: - Private methods
    
    private func showCController() {
        let cVC = UIStoryboard.second.instantiateViewController(withIdentifier: "CViewController") as! CViewControllerProtocol
        cVC.onGoToD = { [weak self] in
            self?.showDController()
        }
        cVC.onPopToB = { [weak self] in
            self?.finishFlow?()
        }
        self.router.push(cVC)
    }
    
    private func showDController() {
        let dVC = UIStoryboard.second.instantiateViewController(withIdentifier: "DViewController") as! DViewControllerProtocol
        dVC.onPopToC = { [weak self] in
            self?.router.popModule()
        }
        dVC.onFinishFlow = { [weak self] in
            self?.finishFlow?()
        }
        self.router.push(dVC)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showCController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol) {
        self.router = router
    }
}
