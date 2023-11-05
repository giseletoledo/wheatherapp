//
//  DailyForecastTableView.swift
//  Wheather App
//
//  Created by GISELE TOLEDO on 05/11/23.
//

import UIKit

class DailyForecastTableView: UITableView {
    
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
        self.dataSource = self
        self.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        self.separatorColor = UIColor.contrastColor
    }
}

extension DailyForecastTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier,
                                                 for: indexPath)
        return cell
    }
}
