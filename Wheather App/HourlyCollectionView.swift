//
//  HourlyCollectionView.swift
//  Wheather App
//
//  Created by GISELE TOLEDO on 04/11/23.
//

import UIKit

class HourlyCollectionView: UICollectionView {
    var dataSourceDelegate: UICollectionViewDataSource?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.indentifier)
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataSourceDelegate(dataSource: UICollectionViewDataSource) {
            self.dataSourceDelegate = dataSource
            self.dataSource = dataSourceDelegate
        }
}

