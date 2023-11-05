//
//  ViewController.swift
//  Wheather App
//
//  Created by GISELE TOLEDO on 02/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = AppImages.background
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var statsView: StatsView = {
        let view = StatsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.textColor = UIColor.contrastColor
           label.text = "PREVISÃO POR HORA"
           label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
           label.textAlignment = .center
           return label
       }()
    
    private lazy var hourlyCollectionView: HourlyCollectionView = {
        let view = HourlyCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dailyForecastLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.textColor = UIColor.contrastColor
           label.text = "PROXIMOS DIAS"
           label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
           label.textAlignment = .center
           return label
       }()
    
    private lazy var dailyForecastTableView: DailyForecastTableView = {
        let tableView = DailyForecastTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(statsView)
        view.addSubview(hourlyForecastLabel)
        view.addSubview(hourlyCollectionView)
        view.addSubview(dailyForecastLabel)
        view.addSubview(dailyForecastTableView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169),

            statsView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            statsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statsView.heightAnchor.constraint(equalToConstant: 67),
            
            hourlyForecastLabel.topAnchor.constraint(equalTo: statsView.bottomAnchor, constant: 29),
            hourlyForecastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            hourlyForecastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 29),
            hourlyCollectionView.heightAnchor.constraint(equalToConstant: 84),
            hourlyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                       hourlyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
                   dailyForecastLabel.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor, constant: 29),
                   dailyForecastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
                   dailyForecastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
                   dailyForecastTableView.topAnchor.constraint(equalTo: dailyForecastLabel.bottomAnchor, constant: 16),
                   dailyForecastTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   dailyForecastTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   dailyForecastTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                   
               ])
    }
    
}

