//
//  HourlyForecastCollectionViewCell.swift
//  Wheather App
//
//  Created by GISELE TOLEDO on 04/11/23.
//

import Foundation
import UIKit


class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let indentifier: String = "HourlyForecastCollectionViewCell"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel,
                                                       iconImageView,
                                                       termperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8,
                                                                     leading: 8,
                                                                     bottom: 8,
                                                                     trailing: 8)
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.contrastColor?.cgColor
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    public lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    public lazy var termperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    public lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(stackView)
    }
    
    private func setConstraints() {
       
        stackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
    
    func loadData(time: String?, icon: UIImage?, temp: String?) {
        let headerView = HeaderView()
        hourLabel.text = time
        iconImageView.image = icon
        headerView.temperatureLabel.text = temp
    }
}
