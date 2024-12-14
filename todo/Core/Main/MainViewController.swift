//
//  MainViewController.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo 🏎️"
        
        view.backgroundColor = .systemBackground
        
        let barButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(barButtonTapped)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func barButtonTapped() {
        viewModel.presentTaskView()
    }
}
