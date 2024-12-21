//
//  CustomAlertView.swift
//  todo
//
//  Created by Demian Basistyi on 12/20/24.
//

import UIKit

final class CustomAlertViewController: UIViewController {
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
        button.tintColor = UIColor.gray
        return button
    }()
    
    var viewModel: CustomAlertViewModel
        
    init(viewModel: CustomAlertViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
    }
    
    func configureContainerView() {
        let containerView = CustomAlertView(frame: .zero, viewModel: viewModel)
        view.addSubview(containerView)
        view.addSubview(dismissButton)
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            dismissButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc private func dismissButtonAction() {
        dismiss(animated: true)
    }
}
