//
//  SettingTableViewCell.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
    
    private var logoLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 0
        lable.font = .systemFont(ofSize: 25)
        return lable
    }()
    private var titleLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 0
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(logo: String, title: String) {
        logoLable.text = logo
        titleLable.text = title
    }
    
    private func layout() {
        self.contentView.addSubview(logoLable)
        self.contentView.addSubview(titleLable)
        NSLayoutConstraint.activate([
            logoLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            logoLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            logoLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLable.leadingAnchor.constraint(equalTo: logoLable.trailingAnchor, constant: 20),
            titleLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
