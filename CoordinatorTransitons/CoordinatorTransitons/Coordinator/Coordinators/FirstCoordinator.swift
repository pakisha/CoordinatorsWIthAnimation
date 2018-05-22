//
//  FirstCoordinator.swift
//  CoordinatorTransitons
//
//  Created by Pavle Pesic on 5/18/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import UIKit

final class FirstCoordinator: BaseCoordinator, CoordinatorFinishOutput {

    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    
    // MARK: - Private methods
    
    private func showAViewController() {
        let aVC = UIStoryboard.first.instantiateViewController(withIdentifier: "AViewController") as! AViewControllerProtocol
        aVC.onGoToBWithFade = { [weak self] in
            self?.showBViewController()
        }
        self.router.setRootModule(aVC, hideBar: true)
    }
    
    private func showBViewController() {
        let bVC = UIStoryboard.first.instantiateViewController(withIdentifier: "BViewController") as! BViewControllerProtocol & UIViewController
        bVC.onPopToAWithFade = { [weak self] in
            self?.router.popModule(transition: FadeAnimator(animationDuration: 0.5, isPresenting: true))
        }
        bVC.onGoToSecondCoordinator = { [weak self] in
            self?.showCViewController(module: bVC)
        }
        self.router.push(bVC, transition: FadeAnimator(animationDuration: 0.5, isPresenting: false))
    }
    
    private func showCViewController(module: (Presentable & UIViewController)) {
        let coordinator = self.coordinatorFactory.makeSecondCoordinatorBox(router: self.router)
        coordinator.finishFlow = { [weak self, weak module, unowned coordinator] in
            self?.removeDependency(coordinator)
            self?.router.popToModule(module: module, animated: true)
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showAViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
}
