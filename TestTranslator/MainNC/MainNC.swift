//
//  MainNC.swift
//  TestTranslator
//
//  Created by Алла alla2104 on 31.08.24.
//

import UIKit

final class MainNC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers.append(TranslateAssembler.translateVC()
        )
    }
}
