//
//  ViewController.swift
//  foodSync
//
//  Created by 김신혜 on 4/2/25.
//

import UIKit

class FoodViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var foodCollectionView: UICollectionView!

    var refrigerator = [FoodItem]()
    var freezer = [FoodItem]()
    var pantry = [FoodItem]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return refrigerator.count
        case 1:
            return freezer.count
        case 2:
            return pantry.count
        default :
            return 0
        }
    }
    
    // 이건 다시 손봐야함 뭐가 이상해...
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCollectionViewCell
        
        switch indexPath.section {
        case 0:
            if let image = UIImage(named: "image_\(indexPath.item)") {
                cell.imageView.image = image
                cell.imageView.isHidden = false
                cell.textLabel.isHidden = true
            } else {
                cell.textLabel.text = "Item \(indexPath.item)"
                cell.imageView.isHidden = true
                cell.textLabel.isHidden = false
            }
        case 1:
            if let image = UIImage(named: "image_\(indexPath.item)") {
                cell.imageView.image = image
                cell.imageView.isHidden = false
                cell.textLabel.isHidden = true
            } else {
                cell.textLabel.text = "Item \(indexPath.item)"
                cell.imageView.isHidden = true
                cell.textLabel.isHidden = false
            }
        case 2:
            if let image = UIImage(named: "image_\(indexPath.item)") {
                cell.imageView.image = image
                cell.imageView.isHidden = false
                cell.textLabel.isHidden = true
            } else {
                cell.textLabel.text = "Item \(indexPath.item)"
                cell.imageView.isHidden = true
                cell.textLabel.isHidden = false
            }
        default :
            break
        }
        
        
        
        
        return UICollectionViewCell()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

