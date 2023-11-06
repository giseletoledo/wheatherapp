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
    
    private lazy var leftArrowButton: UIButton = {
        let button = UIButton()
        let leftArrowImage = UIImage(systemName: "arrow.left")
        button.setImage(leftArrowImage, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(leftArrowTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var rightArrowButton: UIButton = {
        let button = UIButton()
        let rightArrowImage = UIImage(systemName: "arrow.right")
        button.setImage(rightArrowImage, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(rightArrowTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    @objc func leftArrowTapped() {
        currentCityIndex -= 1
        if currentCityIndex < 0 {
            currentCityIndex = cities.count - 1
        }
        updateViewForCurrentCity()
        updateCityLabel()
    }

    @objc func rightArrowTapped() {
        currentCityIndex += 1
        if currentCityIndex >= cities.count {
            currentCityIndex = 0
        }
        updateViewForCurrentCity()
        updateCityLabel()
    }

    
    private let cities: [City] = [
        City(lat: "-3.10719", lon: "-60.0261", name: "Manaus"),
        City(lat: "-15.7801", lon: "-47.9292", name: "Brasília"),
        City(lat: "-12.9716", lon: "-38.5016", name: "Salvador"),
        City(lat: "-27.595377", lon: "-48.548049", name: "Florianópolis"),
        City(lat: "-23.6814346", lon: "-46.9249599", name: "São Paulo")
    ]

    private let service = Service()
    
    private var currentCityIndex: Int = 0
    
    private var city: City {
        return cities[currentCityIndex]
    }

    private func updateViewForCurrentCity() {
        fetchData()
    }

    private func updateCityLabel() {
        headerView.cityLabel.text = city.name
        
        headerView.temperatureLabel.text = forecastResponse?.current.temp.toCelsius()
        statsView.humidityValueLabel.text = "\(forecastResponse?.current.humidity ?? 0)mm"
        statsView.windValueLabel.text = "\(forecastResponse?.current.windSpeed ?? 0)km/h"
        headerView.weatherIcon.image = UIImage(named: forecastResponse?.current.weather.first?.icon ?? "")
    }

    private var forecastResponse: ForecastResponse?

     override func viewDidLoad() {
         super.viewDidLoad()
         setupView()
         fetchData()
         hourlyCollectionView.setDataSourceDelegate(dataSource: self)
         dailyForecastTableView.setDataSourceDelegate(dataSource: self)
     }
     
     private func fetchData() {
         service.fecthData(city: self.city) { [weak self] response in
             self?.forecastResponse = response
             DispatchQueue.main.async {
                 self?.loadData()
             }
         }
     }
     
     private func loadData() {
         updateCityLabel()
         
         if forecastResponse?.current.dt.isDayTime() ?? true {
             backgroundView.image = UIImage(named:"background-day")
         } else {
             backgroundView.image = UIImage(named: "background-night")
         }
         
         hourlyCollectionView.reloadData()
         dailyForecastTableView.reloadData()
     }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(leftArrowButton)
        view.addSubview(rightArrowButton)
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
            
            leftArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            leftArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   
            rightArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            rightArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
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

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        forecastResponse?.hourly.count ?? 0
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.indentifier,
                                                                for: indexPath) as? HourlyForecastCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let forecast = forecastResponse?.hourly[indexPath.row]
            cell.loadData(time: forecast?.dt.toHourFormat(),
                          icon: UIImage(named: forecast?.weather.first?.icon ?? ""),
                          temp: forecast?.temp.toCelsius())
            return cell
        }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        forecastResponse?.daily.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier,
                                                       for: indexPath) as? DailyForecastTableViewCell else {
            return UITableViewCell()
        }
        
        let forecast = forecastResponse?.daily[indexPath.row]
        cell.loadData(weekDay: forecast?.dt.toWeekdayName().uppercased(),
                      min: forecast?.temp.min.toCelsius(),
                      max: forecast?.temp.max.toCelsius(),
                      icon: UIImage(named: forecast?.weather.first?.icon ?? ""))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
