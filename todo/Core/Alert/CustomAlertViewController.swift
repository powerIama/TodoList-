//
//  CustomAlertView.swift
//  todo
//
//  Created by Demian Basistyi on 12/20/24.
//

import UIKit

class CustomAlertView: UIViewController {
    
    let containerView = UIView()
    
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "Update Task 🏎️"
        lable.textAlignment = .center
        lable.numberOfLines = 0
        lable.font = .systemFont(ofSize: 18, weight: .semibold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "task.title".localized()
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "task.description".localized()
        return textField
    }()

    
    private let updateTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("task.create".localized(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.75
        )
        
        configureContainerView()
        
        updateTaskButton.addTarget(
            self,
            action: #selector(updateTaskButtonAction),
            for: .touchUpInside
        )
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(titleLable)
        containerView.addSubview(titleTextField)
        containerView.addSubview(descriptionTextField)
        containerView.addSubview(updateTaskButton)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            
            titleLable.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLable.heightAnchor.constraint(equalToConstant: 28),
            
            titleTextField.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 5),
            descriptionTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            descriptionTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 40),
            
            updateTaskButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 10),
            updateTaskButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            updateTaskButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            updateTaskButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc
    func updateTaskButtonAction() {
        dismiss(animated: true)
    }
}
