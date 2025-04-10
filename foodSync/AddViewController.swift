//
//  AddViewController.swift
//  foodSync
//
//  Created by 김신혜 on 4/2/25.
//

import UIKit

class AddViewController: UIViewController {
    
    var foodCollectionView: UICollectionView!
    var foodItem: FoodItem?
    //인스턴스 생성 추가 해야되는 거 아닌가.
    weak var delegate: FoodDelegate?
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addViewControllerDidCancel(self)
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let foodName = addFoodTextField.text else { return }
        //아래 푸드이미지 구현 후 여기 수정해야함.
        guard let foodImage = UIImage(systemName: "plus") else { return }
        guard let memo = memoTextField.text else { return }
        guard let storage = getSelectedStorageSection() else {
            print("유효하지 않은 저장 위치입니다.")
            return
        }
        print("저장: \(foodName), \(memo), \(storage)")
        //소비기한과 관련된 거 추가해야함.
        
        let newFoodItem = FoodItem(name: foodName, image: foodImage, storage: storage, memo: memo)
//        FoodManager.shared.addFoodItem(newFoodItem)
        delegate?.addViewController(self, didInsert: newFoodItem)
        dismiss(animated: true)
    }
    
    @IBOutlet weak var addFoodTextField: UITextField!
    // 여기에 입력된 정보를 저장하기
    
    @IBOutlet weak var storageSegmentedControl: UISegmentedControl!
//    let storageArray: [String] = ["실온", "냉장", "냉동"]
    
    @IBAction func storageSegmentChanged(_ sender: UISegmentedControl) {
     _ = getSelectedStorageSection()
    }
    
    @IBOutlet weak var dDayLabel: UILabel!
    
    @IBAction func addImageButton(_ sender: Any) {
    }
    
    @IBOutlet weak var memoTextField: UITextField!
    
    func getSelectedStorageSection() -> FoodItem.StorageSection? {
        let selected = storageSegmentedControl.selectedSegmentIndex
        guard let section = FoodItem.StorageSection(rawValue: selected) else {
            print("잘못된 인덱스입니다.")
            return nil
        }
        print("선택된 저장 위치: \(section.storageSctionStr)")
        return section
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = foodItem {
            
                  print("받은 아이템: \(item)")
                  // 예: imageView.image = item.image
              }
    }
    
}
