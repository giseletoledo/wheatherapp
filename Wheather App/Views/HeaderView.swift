//
//  WheatherView.swift
//  Wheather App
//
//  Created by GISELE TOLEDO on 02/11/23.
//

import UIKit

class HeaderView: UIView {
    
    private lazy var containerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor.contrastColor
            view.layer.cornerRadius = 20
            return view
        }()
    
      private lazy var cityLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = UIFont.systemFont(ofSize: 20)
          label.text = AppText.citylabel
          label.textAlignment = .center
          label.textColor = UIColor.primaryColor
          return label
      }()
      
      private lazy var temperatureLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
          label.text = AppText.temperatureLabel
          label.textAlignment = .left
          label.textColor = UIColor.primaryColor
          return label
      }()
      
      private lazy var weatherIcon: UIImageView = {
          let imageView = UIImageView()
          imageView.translatesAutoresizingMaskIntoConstraints = false
          imageView.image = AppImages.sunIcon
          imageView.contentMode = .scaleAspectFit
          return imageView
      }()
    
    init() {
        super.init(frame: .zero)
        setHierarchy()
        setConstraints()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy(){
        addSubview(containerView)
        containerView.addSubview(cityLabel)
        containerView.addSubview(temperatureLabel)
        containerView.addSubview(weatherIcon)
    }
    
    private func setupAppearance() {
        
        let shadowColor = UIColor.shadowColor
        
        // Adicione uma sombra simples
        self.containerView.layer.shadowColor = shadowColor?.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.containerView.layer.shadowOpacity = 0.5
        self.containerView.layer.shadowRadius = 2
        self.containerView.layer.masksToBounds = false
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 169)
             ])
                
                NSLayoutConstraint.activate([
                    cityLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
                                cityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
                                cityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
                                cityLabel.heightAnchor.constraint(equalToConstant: 20),
                                temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21),
                                temperatureLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26),
                                weatherIcon.heightAnchor.constraint(equalToConstant: 86),
                                weatherIcon.widthAnchor.constraint(equalToConstant: 86),
                                weatherIcon.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -26),
                                weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
                                weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 15)
                ])
    }
}

