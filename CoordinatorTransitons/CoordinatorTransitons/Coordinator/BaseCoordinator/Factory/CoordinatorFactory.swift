//
//  CoordinatorFactory.swift
//  iOSStyleguide
//
//  Created by Pavle Pesic on 3/14/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func makeFirstCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> Coordinator & CoordinatorFinishOutput
    func makeSecondCoordinatorBox(router: RouterProtocol) -> Coordinator & CoordinatorFinishOutput
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    // MARK: - CoordinatorFactoryProtocol
    
    func makeFirstCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> Coordinator & CoordinatorFinishOutput {
        let coordinator = FirstCoordinator(router: router, coordinatorFactory: coordinatorFactory)
        return coordinator
    }
    
    func makeSecondCoordinatorBox(router: RouterProtocol) -> Coordinator & CoordinatorFinishOutput {
        let coordinator = SecondCoordinator(router: router)
        return coordinator
    }
    
}
