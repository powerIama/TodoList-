//
//  CustomAlertView.swift
//  todo
//
//  Created by Demian Basistyi on 12/20/24.
//

import UIKit

final class CustomAlertView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "task.update".localized()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        button.isEnabled = false
        return button
    }()
    
    final var viewModel: CustomAlertViewModel
    
    init(frame: CGRect, viewModel: CustomAlertViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
        textFieldDidChange()
        
        updateTaskButton.addTarget(self, action: #selector(updateTaskButtonAction), for: .touchUpInside)
        titleTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        descriptionTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(titleLabel)
        self.addSubview(titleTextField)
        self.addSubview(descriptionTextField)
        self.addSubview(updateTaskButton)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 40),
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 5),
            descriptionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 40),
            updateTaskButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 10),
            updateTaskButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            updateTaskButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            updateTaskButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc private func updateTaskButtonAction() {
        guard viewModel.validateFields(
            title: titleTextField.text ?? "",
            description: descriptionTextField.text ?? ""
        ) else {
            return
        }
        print("Update Task")
    }
    
    @objc private func textFieldDidChange() {
        updateTaskButton.isEnabled = viewModel.validateFields(
            title: titleTextField.text ?? "",
            description: descriptionTextField.text ?? ""
        )
        UIView.animate(withDuration: 0.25) {
            self.updateTaskButton.backgroundColor = self.updateTaskButton.isEnabled ? .systemBlue : .systemGray5
            self.updateTaskButton.setTitleColor(self.updateTaskButton.isEnabled ? .white : .gray, for: .normal)
        }
    }
}
