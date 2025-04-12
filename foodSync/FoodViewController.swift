//
//  ViewController.swift
//  foodSync
//
//  Created by 김신혜 on 4/2/25.
//

import UIKit

class FoodViewController: UIViewController {
    
    static let cellSize: CGFloat = 80  // 셀 크기 상수
    
    @IBOutlet weak var foodCollectionView: UICollectionView!

    let dataManager = FoodDataManager()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? AddViewController {
            vc.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        loadSampleData()
    }

    private func setupCollectionView() {
        foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
        
        // 컬렉션 뷰 레이아웃 설정
        if let layout = foodCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        // 컬렉션 뷰 설정
        foodCollectionView.backgroundColor = .systemBackground
        foodCollectionView.alwaysBounceVertical = true
    }
       
    private func loadSampleData() {
        // 샘플 데이터 로드
        dataManager.addItem(FoodItem(name: "시리얼", storage: .pantry))
        dataManager.addItem(FoodItem(name: "쌀", storage: .pantry))
        
        dataManager.addItem(FoodItem(name: "우유", storage: .refrigerator))
        dataManager.addItem(FoodItem(name: "요구르트", storage: .refrigerator))
        
        dataManager.addItem(FoodItem(name: "아이스크림", storage: .freezer))
        dataManager.addItem(FoodItem(name: "냉동 만두", storage: .freezer))
        
        foodCollectionView.reloadData()
    }
}
extension FoodViewController: UICollectionViewDataSource {
    // 이게 테이블 뷰와 다른 점. 섹션 수와 섹션 안의 아이템 수를 줘야한다.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataManager.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataManager.numberOfItems(in: section)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Creating cell for section: \(indexPath.section), item: \(indexPath.item)")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCell
        
        // 저장소에 따라 foodItem 선택
        let sectionItems = dataManager.items(for: indexPath.section)
        if indexPath.item < sectionItems.count {
            let item = sectionItems[indexPath.item]
            print("Configuring cell with item: \(item.name)")
            cell.configure(with: item)
        } else {
            print("No item found for indexPath: \(indexPath)")
        }
        return cell
    }
        
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "HeaderView",
                for: indexPath) as! FoodSectionHeaderView
            
            if let section = FoodItem.StorageSection(rawValue: indexPath.section) {
                headerView.titleLabel.text = section.storageSctionStr
                
                // 섹션별 색상 설정 (선택사항)
                switch section {
                case .pantry:
                    headerView.backgroundColor = UIColor.systemOrange.withAlphaComponent(0.2)
                case .refrigerator:
                    headerView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
                case .freezer:
                    headerView.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.2)
                }
            }
            return headerView
        }
        return UICollectionReusableView()
    }
        
}

extension FoodViewController: UICollectionViewDelegate {
    
      
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          //길게 눌렀을 때 수정할 수 있는 창을 띄울 수 있게끔
          // 선택된 데이터 가져오기
            let selectedItems: FoodItem
            switch indexPath.section {
            case 0:
                selectedItems = dataManager.pantryItems[indexPath.item]
            case 1:
                selectedItems = dataManager.refrigeratorItems[indexPath.item]
            case 2:
                selectedItems = dataManager.freezerItems[indexPath.item]
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
      
}

extension FoodViewController: FoodDelegate {
  
    func addViewController(_ vc: UIViewController, didInsert food: FoodItem) {
        dataManager.addItem(food)
        foodCollectionView.reloadData()
    }
    
    func addViewControllerDidCancel(_ vc: UIViewController) {
        
    }
    
}

extension FoodViewController: UICollectionViewDelegateFlowLayout {
    // MARK: - 레이아웃 상수
    private struct LayoutMetrics {
        static let spacing: CGFloat = 10          // 기본 간격
        static let sectionSpacing: CGFloat = 20   // 섹션 사이 간격
        static let headerHeight: CGFloat = 40     // 헤더 높이
        static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
    }
    
    // MARK: - 셀 크기
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 모든 셀의 크기를 동일하게 유지
        return CGSize(width: FoodViewController.cellSize, height: FoodViewController.cellSize)
    }
    
    // MARK: - 섹션 여백
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       insetForSectionAt section: Int) -> UIEdgeInsets {
        return LayoutMetrics.edgeInsets
    }
    
    // MARK: - 셀 간격
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutMetrics.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutMetrics.spacing
    }
    
    // MARK: - 헤더 크기
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: LayoutMetrics.headerHeight)
    }
}
