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
        guard let foodName = addFoodTextField.text, !foodName.isEmpty else {
            print("음식 이름을 입력해주세요.")
            return
        }
        
        // 이미지는 선택적이므로 옵셔널로 처리
        let foodImage = imageView?.image
        
        // 메모는 선택적이므로 옵셔널로 처리
        let memo = memoTextField.text
        
        guard let storage = getSelectedStorageSection() else {
            print("유효하지 않은 저장 위치입니다.")
            return
        }
        
        print("저장: \(foodName), 메모: \(memo ?? "없음"), 저장위치: \(storage.storageSctionStr)")
        
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
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func addImageButton(_ sender: Any) {
        // 사진첩 접근
               let imagePicker = UIImagePickerController()
               imagePicker.sourceType = .photoLibrary
               imagePicker.delegate = self
               present(imagePicker, animated: true)
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
        imageView.contentMode = .scaleAspectFit
        if let item = foodItem {
            
                  print("받은 아이템: \(item)")
                  // 예: imageView.image = item.image
              }
    }
    
}

extension AddViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 사용자가 사진을 선택했을 때
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // 이미지 크기 조절 - FoodViewController의 셀 크기 상수 사용
            let size = CGSize(width: FoodViewController.cellSize, height: FoodViewController.cellSize)
            let renderer = UIGraphicsImageRenderer(size: size)
            let resizedImage = renderer.image { (context) in
                selectedImage.draw(in: CGRect(origin: .zero, size: size))
            }
            imageView.image = resizedImage
        }
        dismiss(animated: true)
    }
    
    // 사용자가 취소했을 때
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    // 알림창 표시 함수
    func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
