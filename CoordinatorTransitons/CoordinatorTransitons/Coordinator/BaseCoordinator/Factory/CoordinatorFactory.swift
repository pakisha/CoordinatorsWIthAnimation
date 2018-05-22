//
//  CoordinatorFactory.swift
//  iOSStyleguide
//
//  Created by Pavle Pesic on 3/14/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func makeFirstCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> FirstCoordinator
    func makeSecondCoordinatorBox(router: RouterProtocol) -> SecondCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    // MARK: - CoordinatorFactoryProtocol
    
    func makeFirstCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> FirstCoordinator {
        let coordinator = FirstCoordinator(router: router, coordinatorFactory: coordinatorFactory)
        return coordinator
    }
    
    func makeSecondCoordinatorBox(router: RouterProtocol) -> SecondCoordinator {
        let coordinator = SecondCoordinator(router: router)
        return coordinator
    }
    
}
