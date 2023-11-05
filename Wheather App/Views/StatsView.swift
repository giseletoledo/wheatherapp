//
//  StatsView.swift
//  Wheather App
//
//  Created by GISELE TOLEDO on 02/11/23.
//

import UIKit

class StatsView: UIView {
  
    private lazy var humidityLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text =  AppText.humidityLabel
          label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
          label.textColor = UIColor.contrastColor
          return label
      }()
      
      private lazy var humidityValueLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = AppText.humidityValueLabel
          label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
          label.textColor = UIColor.contrastColor
          return label
      }()
      
      private lazy var humidityStackView: UIStackView = {
          let stackView = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
          stackView.axis = .horizontal
          stackView.translatesAutoresizingMaskIntoConstraints = false
          return stackView
      }()
      
      private lazy var windLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = AppText.windLabel
          label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
          label.textColor = UIColor.contrastColor
          return label
      }()
      
      private lazy var windValueLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = AppText.windValueLabel
          label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
          label.textColor = UIColor.contrastColor
          return label
      }()
      
      private lazy var windStackView: UIStackView = {
          let stackView = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
          stackView.axis = .horizontal
          stackView.translatesAutoresizingMaskIntoConstraints = false
          return stackView
      }()
      
      private lazy var statsStackView: UIStackView = {
          let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
          stackView.axis = .vertical
          stackView.translatesAutoresizingMaskIntoConstraints = false
          stackView.spacing = 3
          stackView.backgroundColor = UIColor.softColorGray
          stackView.layer.cornerRadius = 10
          stackView.isLayoutMarginsRelativeArrangement = true
          stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12,
                                                                       leading: 24,
                                                                       bottom: 12,
                                                                       trailing: 24)
          return stackView
      }()
    
    init() {
        super.init(frame: .zero)
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy(){
        addSubview(statsStackView)
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            statsStackView.topAnchor.constraint(equalTo: topAnchor),
            statsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            statsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),            
      ])
    }
}
