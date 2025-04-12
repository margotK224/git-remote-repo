//
//  FoodCollectionViewCell.swift
//  foodSync
//
//  Created by 김신혜 on 4/2/25.
//

import UIKit

class FoodCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    func configure(with item: FoodItem) {
        print("Configuring cell with item name: \(item.name)")
        
        // 아웃렛이 nil이 아닌지 확인
        guard let imageView = imageView, let textLabel = textLabel else {
            print("Error: Outlets are not connected - imageView: \(imageView == nil ? "nil" : "not nil"), textLabel: \(textLabel == nil ? "nil" : "not nil")")
            return
        }
        
        // 항상 이름 설정
        textLabel.text = item.name
        print("Set text label to: \(item.name)")
        
        if let image = item.image {
            // 이미지가 있는 경우
            print("Image found, displaying image")
            imageView.image = image
            imageView.isHidden = false
            textLabel.isHidden = true
        } else {
            // 이미지가 없는 경우
            print("No image found, displaying text")
            imageView.image = nil
            imageView.isHidden = true
            textLabel.isHidden = false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("FoodCell awakeFromNib called")
        
        // 셀의 기본 설정
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 8
        
        // 이미지뷰 설정
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
        
        // 텍스트 레이블 설정
        textLabel?.textAlignment = .center
        textLabel?.font = UIFont.systemFont(ofSize: 16)
        textLabel?.numberOfLines = 0
        textLabel?.adjustsFontSizeToFitWidth = true
        
        // 고정 크기 설정
        let size = CGSize(width: FoodViewController.cellSize, height: FoodViewController.cellSize)
        self.frame = CGRect(origin: .zero, size: size)
        contentView.frame = CGRect(origin: .zero, size: size)
        
        print("Outlets after awakeFromNib - imageView: \(imageView == nil ? "nil" : "not nil"), textLabel: \(textLabel == nil ? "nil" : "not nil")")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 고정된 크기 유지
        let size = CGSize(width: FoodViewController.cellSize, height: FoodViewController.cellSize)
        self.frame.size = size
        contentView.frame.size = size
        
        // 이미지뷰와 텍스트 레이블 크기 조정
        imageView?.frame = contentView.bounds
        textLabel?.frame = contentView.bounds
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        // Auto Layout 크기 조정 방지
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        attributes.frame.size = CGSize(width: FoodViewController.cellSize, height: FoodViewController.cellSize)
        return attributes
    }
    
   

//    
    // 초기화 메서드
//     override init(frame: CGRect) {
//         super.init(frame: frame)
//         
//         // 이미지 뷰 추가
//         contentView.addSubview(imageView)
//         NSLayoutConstraint.activate([
//             imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//             imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//             imageView.widthAnchor.constraint(equalToConstant: 50),
//             imageView.heightAnchor.constraint(equalToConstant: 50)
//         ])
//         
//         // 라벨 추가
//         contentView.addSubview(textLabel)
//         NSLayoutConstraint.activate([
//             textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
//             textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//             textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//             textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
//         ])
//         
//         // 셀 스타일
//         contentView.backgroundColor = .lightGray
//         contentView.layer.cornerRadius = 8
//     }
//     
//     required init?(coder: NSCoder) {
//         fatalError("init(coder:) has not been implemented")
//     }

    
}
