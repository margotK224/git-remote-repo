//
//  FoodDelegate.swift
//  foodSync
//
//  Created by 김신혜 on 4/10/25.
//

import UIKit

protocol FoodDelegate: AnyObject {
    func addViewController(_ vc: UIViewController, didInsert food: FoodItem)
    
    func addViewControllerDidCancel(_ vc: UIViewController)
}
