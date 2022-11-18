//
//  OpenMarket - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import Foundation

class ViewController: UIViewController {
    var productData: [Product] = []
    var network = NetWork()
    
    enum Section {
        case main
    }
    
    var gridCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, ListPage>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        network.getProductData { (result: Result<Product, Error>) in
            switch result {
            case .success(let data):
                self.productData.insert(data, at: 0)
                DispatchQueue.main.sync {
                    self.createGridCollectionView()
                    self.configDataSource(listPage: data.pages)
                    self.gridCollectionView.reloadData()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(self.view.frame.height * 0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = CGFloat(10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    func createGridCollectionView() {
        gridCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())

        view.addSubview(gridCollectionView)
        gridCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            gridCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gridCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gridCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gridCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func configDataSource(listPage: [ListPage]) {
        let cellRegistration = UICollectionView.CellRegistration<ProductCollectionViewCell, ListPage> { cell, indexPath, product in
            cell.configCell(product: product)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, ListPage>(collectionView: gridCollectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        var snapShot = NSDiffableDataSourceSnapshot<Section, ListPage>()
        snapShot.appendSections([.main])
        snapShot.appendItems(listPage)
        dataSource.apply(snapShot)
    }

}
