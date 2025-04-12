//
//  FoodSectionHeaderView.swift
//  foodSync
//
//  Created by 김신혜 on 4/11/25.
//

import UIKit
class FoodSectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupHeader()
    }
    
    private func setupHeader() {
        // 기본 스타일링
        layer.cornerRadius = 8
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }
}

