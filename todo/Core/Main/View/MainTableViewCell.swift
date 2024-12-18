//
//  MainTableViewCell.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    private let todoNameLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = .systemFont(ofSize: 18, weight: .bold)
        lable.textColor = .black
        return lable
    }()
    
    private let descriptionLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = .systemFont(ofSize: 14, weight: .regular)
        lable.textColor = .black
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, description: String) {
        todoNameLable.text = name
        descriptionLable.text = description
    }
    
    private func layout() {
        self.contentView.addSubview(todoNameLable)
        self.contentView.addSubview(descriptionLable)
        NSLayoutConstraint.activate([
            todoNameLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            todoNameLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            todoNameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            descriptionLable.topAnchor.constraint(equalTo: todoNameLable.bottomAnchor, constant: 5),
            descriptionLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
