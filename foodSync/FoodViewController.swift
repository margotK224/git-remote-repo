//
//  ViewController.swift
//  foodSync
//
//  Created by 김신혜 on 4/2/25.
//

import UIKit

class FoodViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
// UICollectionViewDelegateFlowLayout 프로토콜은 완성 후 사이즈 조절 등 필요할 때 사용할 것
    
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
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCell
        
        // 저장소에 따라 foodItem 선택
        var foodItem: FoodItem
        switch indexPath.section {
        case 0:
            foodItem = refrigerator[indexPath.item]
        case 1:
            foodItem = freezer[indexPath.item]
        case 2:
            foodItem = pantry[indexPath.item]
        default:
            fatalError("존재하지 않는 섹션")
        }
        
        // foodItem에서 값 꺼내서 cell에 넣기
//        cell.imageView.image = foodItem.image
//        cell.textLabel.text = foodItem.name
        if let image = foodItem.image {
            cell.imageView.image = image
            cell.imageView.isHidden = false
            cell.textLabel.isHidden = true
        } else {
            cell.textLabel.text = foodItem.name
            cell.imageView.isHidden = true
            cell.textLabel.isHidden = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //길게 눌렀을 때 수정할 수 있는 창을 띄울 수 있게끔
        // 선택된 데이터 가져오기
          let selectedItem: FoodItem
          switch indexPath.section {
          case 0:
              selectedItem = refrigerator[indexPath.item]
          case 1:
              selectedItem = freezer[indexPath.item]
          case 2:
              selectedItem = pantry[indexPath.item]
          default:
              return
          }
          
          // 스토리보드에서 AddViewController 인스턴스화
//          let storyboard = UIStoryboard(name: "Main", bundle: nil)
//          if let addVC = storyboard.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController {
//              addVC.foodItem = selectedItem // 데이터 넘기기
//              navigationController?.pushViewController(addVC, animated: true)
//          }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? AddViewController {
            vc.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension FoodViewController: FoodDelegate {
  
    func addViewController(_ vc: UIViewController, didInsert food: FoodItem) {
        if food.storage == .refrigerator {
            refrigerator.append(food)
        } else if food.storage == .freezer {
            freezer.append(food)
        } else if food.storage == .pantry {
            pantry.append(food)
        } else {
            
        }
        foodCollectionView.reloadData()
    }
    
    func addViewControllerDidCancel(_ vc: UIViewController) {
        
    }
    
}
