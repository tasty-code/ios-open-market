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
        // 입력된 url 체크
        if url.isEmpty {
            completion(nil)
            return
        }
        
        // URL 타입으로 변경
        guard let imageURL = URL(string: url) else {
            return
        }
        
        
        DispatchQueue.global(qos: .background).async {
            // URL -> Data
            if let data = try? Data(contentsOf: imageURL) {
                // Data -> UIImage
                let image = UIImage(data: data)!
                
                // UI 업데이트를 위한 main 쓰레드 사용
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
