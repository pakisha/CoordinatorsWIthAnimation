//
//  UIStoryboard.swift
//  CoordinatorTransitons
//
//  Created by Pavle Pesic on 5/18/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var first: UIStoryboard {
        return UIStoryboard.init(name: "First", bundle: nil)
    }
    
    static var second: UIStoryboard {
        return UIStoryboard.init(name: "Second", bundle: nil)
    }
}
