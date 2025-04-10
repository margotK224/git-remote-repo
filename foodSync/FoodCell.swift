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
    
//    let imageView: UIImageView = {
//            let imageView = UIImageView()
//            imageView.contentMode = .scaleAspectFit
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            return imageView
//        }()
//    
//    let textLabel: UILabel = {
//           let label = UILabel()
//           label.textAlignment = .center
//           label.font = UIFont.systemFont(ofSize: 16)
//           label.translatesAutoresizingMaskIntoConstraints = false
//           return label
//       }()
//    
//    // 초기화 메서드
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
