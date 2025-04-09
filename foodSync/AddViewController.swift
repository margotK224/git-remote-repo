//
//  AddViewController.swift
//  foodSync
//
//  Created by 김신혜 on 4/2/25.
//

import UIKit

class AddViewController: UIViewController {
    
    var foodCollectionView: UICollectionView!
   
    //인스턴스 생성 추가 해야되는 거 아닌가.
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var addFoodTextField: UITextField!
    
    // 여기에 입력된 정보를 저장하기
    
    @IBOutlet weak var storageSegmentedControl: UISegmentedControl!
    let storageArray: [String] = ["실온", "냉장", "냉동"]
    
    @IBAction func storageSegmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print(sender.titleForSegment(at: 0) ?? "실온")
        } else if sender.selectedSegmentIndex == 1 {
            print(sender.titleForSegment(at: 1) ?? "냉장")
        } else if sender.selectedSegmentIndex == 2 {
            print(sender.titleForSegment(at: 2) ?? "냉동")
        }
        
    }
    
    @IBOutlet weak var dDayLabel: UILabel!
    
    @IBAction func addImageButton(_ sender: Any) {
    }
    
    @IBOutlet weak var memoTextField: UITextField!
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
