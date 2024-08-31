//
//  UIViewController+Instance.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 17.05.24.
//

import UIKit

extension UIViewController {
    
    static func instanceFromStoryboard(
        sourceStoryboard: UIStoryboard = .main
    ) -> Self {
        return sourceStoryboard.instantiateViewController(
            withIdentifier: "\(Self.self)"
        ) as! Self
    }
}
