//
//  OpenMarket - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit
import Foundation

class ViewController: UIViewController {
    var productData: [DetailPage] = []
    var network = NetWork()
    enum Section {
        case main
    }
    var gridCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, DetailPage>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ddd"
        getData()
    }
    
    func getData() {
        network.getDetailPageData { (result: Result<DetailPage, Error>) in
            switch result {
            case .success(let success):
                self.productData.append(success)
                DispatchQueue.main.sync {
                    self.createGridCollectionView()
                    self.configDataSource()
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
        group.interItemSpacing = .fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = CGFloat(10)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

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
    
    func configDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<ProductCollectionViewCell, DetailPage> { cell,indexPath,product in
            cell.configCell(with: product)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, DetailPage>(collectionView: gridCollectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        var snapShot = NSDiffableDataSourceSnapshot<Section, DetailPage>()
        snapShot.appendSections([.main])
        snapShot.appendItems(productData)
        dataSource.apply(snapShot)
    }

}
