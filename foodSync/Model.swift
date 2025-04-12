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

// 데이터 관리 클래스
class FoodDataManager {
    // 모든 음식 아이템을 저장하는 배열
    private var allItems: [FoodItem] = []
    
    // 섹션별로 아이템을 필터링하는 계산 속성들
    var pantryItems: [FoodItem] {
        return allItems.filter { $0.storage == .pantry }
    }
    
    var refrigeratorItems: [FoodItem] {
        return allItems.filter { $0.storage == .refrigerator }
    }
    
    var freezerItems: [FoodItem] {
        return allItems.filter { $0.storage == .freezer }
    }
    
    // 모든 섹션 배열 (순서 유지)
    let allSections: [FoodItem.StorageSection] = [.pantry, .refrigerator, .freezer]
    
    // 섹션에 해당하는 아이템 배열 반환
    func items(for section: Int) -> [FoodItem] {
        guard let storageSection = FoodItem.StorageSection(rawValue: section) else {
            return []
        }
        
        return allItems.filter { $0.storage == storageSection }
    }
    
    // 아이템 추가
    func addItem(_ item: FoodItem) {
        allItems.append(item)
    }
    
    // 아이템 삭제
    func removeItem(at indexPath: IndexPath) {
        guard let section = FoodItem.StorageSection(rawValue: indexPath.section) else {
            return
        }
        
        let sectionItems = items(for: indexPath.section)
        if indexPath.item < sectionItems.count {
            let itemToRemove = sectionItems[indexPath.item]
            allItems.removeAll(where: { $0.name == itemToRemove.name }) // 간단한 예시, 실제로는 고유 ID로 식별하는 것이 좋음
        }
    }
    
    // 섹션 개수
    var numberOfSections: Int {
        return FoodItem.StorageSection.freezer.rawValue + 1 // 모든 케이스 수
    }
    
    // 섹션별 아이템 개수
    func numberOfItems(in section: Int) -> Int {
        return items(for: section).count
    }
}

