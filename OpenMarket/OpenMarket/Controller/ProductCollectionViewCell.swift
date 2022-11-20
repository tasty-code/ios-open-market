//
//  ProductCollectionViewCell.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/11/16.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 2
        return stackView
    }()
    
    private var productImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let nameLb = UILabel()
        nameLb.numberOfLines = 0
        nameLb.font = UIFont.boldSystemFont(ofSize: 18)
        return nameLb
    }()
    
    private let priceLabel: UILabel = {
        let priceLb = UILabel()
        priceLb.numberOfLines = 0
        return priceLb
    }()
    
    private let bargainPriceLabel: UILabel = {
        let bgPriceLb = UILabel()
        bgPriceLb.numberOfLines = 0
        return bgPriceLb
    }()
    
    private let stockLabel: UILabel = {
        let stockLb = UILabel()
        stockLb.numberOfLines = 0
        return stockLb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
        self.stockLabel.text = nil
        self.stockLabel.attributedText = nil
    }
    
    private func setLayout() {
        [productImage, nameLabel, priceLabel, bargainPriceLabel, stockLabel].forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
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
        if product.price == product.bargainPrice {
            priceLabel.text = String(product.price)
        } else {
            priceLabel.text = String(product.price)
            if priceLabel.text != nil {
                let attributeString = NSMutableAttributedString(string: priceLabel.text ?? "")

              attributeString.addAttribute(.strikethroughStyle,
                                            value: NSUnderlineStyle.single.rawValue,
                                            range: NSMakeRange(0, attributeString.length))

                priceLabel.attributedText = attributeString
            }
            bargainPriceLabel.text = String(product.bargainPrice)
        }
        
        if product.stock != 0 {
            stockLabel.text = "잔여 수량 : " + String(product.stock)
        } else {
            stockLabel.text = "품절"
        }
    }
}

