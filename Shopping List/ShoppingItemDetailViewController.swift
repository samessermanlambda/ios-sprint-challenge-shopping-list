//
//  ShoppingItemDetailViewController.swift
//  Shopping List
//
//  Created by Samuel Esserman on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemDetailViewController: UIViewController {
//MARK: - Outlets
    @IBOutlet weak var shoppingListCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sendOrderButton: UIButton!
    
    var shoppingItemCount: Int?
    
    override func viewDidLoad() {
        if let _ = shoppingItemCount {
            updateViews()
        }
    }
    
    func updateViews() {
        if let count = shoppingItemCount {
            sendOrderButton.isEnabled =  true
            if count > 1 {
                shoppingListCountLabel.text = "Order The \(count) Items From Your Shopping List"
                
            } else if count == 1 {
                shoppingListCountLabel.text = "Order The \(count) Item From Your Shopping List"
            } else if count < 1 {
                shoppingListCountLabel.text = "There's No Items In Your Shopping List"
                sendOrderButton.isEnabled = false
            }
        }
        
        
    }

//MARK: - Actions
    @IBAction func sendOrderTapped(_ sender: Any) {
        if let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty {
                    let title = "Delivery For \(name)"
                    let body = "Your order will be delivered to \(address) in 15 minutes"
                    
                    navigationController?.popViewController(animated: true)
                    
                    NotificationCenter.sharedNotificationCenter.sendNotification(title: title, message: body)
                }
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

