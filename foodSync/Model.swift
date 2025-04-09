//
//  Model.swift
//  foodSync
//
//  Created by 김신혜 on 4/2/25.
//

import UIKit




struct FoodItem {
    enum StorageSection: Int {
        case pantry = 0
        case refrigerator = 1
        case freezer = 2
        
        var storageSctionStr: String {
            switch self {
            case .pantry: return "실온"
            case .refrigerator: return "냉장"
            case .freezer: return "냉동"
            }
        }
    }
    var name: String
    var image: UIImage?
    var expirationDate: Date?
    var storage: StorageSection
    var memo: String?
//    
//    init(name: String, image: UIImage? = nil, storage: StorageSection, expirationDate: Date?, memo: String? = nil) {
//        self.name = name
//        self.image = image
//        self.storage = storage
//        self.expirationDate = expirationDate
//        self.memo = memo
//    }
}

