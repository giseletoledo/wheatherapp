//
//  DailyForecastTableView.swift
//  Wheather App
//
//  Created by GISELE TOLEDO on 05/11/23.
//

import UIKit

class DailyForecastTableView: UITableView {
    var dataSourceDelegate: UITableViewDataSource?
    
    // MARK: - Initialization
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTableView()
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        self.separatorColor = UIColor.contrastColor
    }
    
    func setDataSourceDelegate(dataSource: UITableViewDataSource) {
            self.dataSourceDelegate = dataSource
            self.dataSource = dataSourceDelegate
        }
}

