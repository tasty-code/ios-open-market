//
//  ProductCollectionViewCell.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/11/16.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"
    
    let productImage: UIImageView = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func layout() {
        [productImage, nameLabel, priceLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    func configCell(with product: DetailPage) {
        ImageLoader.loadImage(from: product.thumbnail) { image in
            self.productImage.image = image
        }
        
        let attrString1 = NSAttributedString(
            string: product.name
        )
        
        let attrString2 = NSAttributedString(
            string: String(product.price)
        )
        
        nameLabel.attributedText = attrString1
        priceLabel.attributedText = attrString2
    }
}
