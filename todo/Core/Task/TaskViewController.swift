//
//  TaskViewController.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class TaskViewController: UIViewController {
    
    let titleLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = .systemFont(ofSize: 20, weight: .bold)
        lable.textAlignment = .center
        lable.text = "Create New Task".localized()
        return lable
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title".localized()
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Description".localized()
        return textField
    }()
    
    let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create".localized(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.isEnabled = false
        return button
    }()
    
    var viewModel: TaskViewModel
    
    init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backgroundAppoitment: Bool = false {
        didSet {
            createButton.backgroundColor = backgroundAppoitment ? .systemGray4: .clear
            createButton.setTitleColor(backgroundAppoitment ? .systemBlue: .clear, for: .normal)
            createButton.layer.borderWidth = backgroundAppoitment ? 0.5: 0.0
            createButton.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Task".localized()
        view.backgroundColor = .systemBackground
        layout()
        
        titleTextField.addTarget(
            self,
            action: #selector(textFieldDidChange),
            for: .editingChanged
        )
        descriptionTextField.addTarget(
            self,
            action: #selector(textFieldDidChange),
            for: .editingChanged
        )
        
        createButton.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
        
        textFieldDidChange()
    }
    
    func layout() {
        view.addSubview(titleLable)
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(createButton)
        NSLayoutConstraint.activate([
            
            titleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleTextField.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 40),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 50),
            
            createButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            createButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func textFieldDidChange() {
        guard viewModel.validateFields(title: titleTextField.text ?? "", description: descriptionTextField.text ?? "" ) else {
            backgroundAppoitment = false
            return
        }
        backgroundAppoitment = true
    }
    
    @objc func buttonTapped() {
        guard let title = titleTextField.text, !title.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty
        else {
            return
        }
        viewModel.createNewTask(title: title, description: description)
        dismiss(animated: true)
    }
}
