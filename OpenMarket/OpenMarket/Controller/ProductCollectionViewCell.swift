//
//  ProductCollectionViewCell.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/11/16.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    var productImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let nameLabel: UILabel = {
        let nameLb = UILabel()
        nameLb.numberOfLines = 0
        return nameLb
    }()
    
    let priceLabel: UILabel = {
        let priceLb = UILabel()
        priceLb.numberOfLines = 0
        return priceLb
    }()
    
    let bargainPriceLabel: UILabel = {
        let bgPriceLb = UILabel()
        bgPriceLb.numberOfLines = 0
        return bgPriceLb
    }()
    
    let stockLabel: UILabel = {
        let stockLb = UILabel()
        stockLb.numberOfLines = 0
        return stockLb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
    }
    
    func layout() {
        [productImage, nameLabel, priceLabel, bargainPriceLabel, stockLabel].forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
        ])
    }
    
    func configCell(product: ListPage) {
        ImageLoader.loadImage(from: product.thumbnail) { image in
            self.productImage.image = image
        }
        nameLabel.text = product.name
        priceLabel.text = String(product.price)
        bargainPriceLabel.text = String(product.bargainPrice)
        stockLabel.text = "잔여 수량 : " + String(product.stock)
    }
}
