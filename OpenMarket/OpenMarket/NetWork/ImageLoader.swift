//
//  ImageLoader.swift
//  OpenMarket
//
//  Created by 박도원 on 2022/11/16.
//

import Foundation
import UIKit

class ImageLoader {
    static func loadImage(from url: String, completion: @escaping (UIImage?) -> ()) {
        if url.isEmpty {
            completion(nil)
            return
        }
    
        guard let imageURL = URL(string: url) else {
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: imageURL),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
