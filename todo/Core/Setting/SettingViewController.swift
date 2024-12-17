//
//  SettingViewController.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    var viewModel: SettingViewModel
    
    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
        view.backgroundColor = .systemBackground
    }
}
