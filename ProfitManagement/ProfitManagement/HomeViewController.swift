//
//  HomeViewController.swift
//  ProfitManagement
//
//  Created by Ngoc IT. Nguyen Khanh on 24/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var viewProfitContainer: UIView!
    @IBOutlet weak var viewProfitDetail: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewProfitContainer.layer.cornerRadius = viewProfitContainer.bounds.width/2
        viewProfitDetail.layer.cornerRadius = viewProfitDetail.bounds.width/2
    }
    
    @IBAction func handleIncome(_ sender: UIButton) {
        showInputAlertController(with: "Thu tiền")
    }
    
    @IBAction func handleOutcome(_ sender: UIButton) {
        showInputAlertController(with: "Chi tiền")
    }
    
    func showInputAlertController(with title: String) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Lưu", style: .cancel, handler: { _ in
            // Nothing
        })
        
        let cancelAction = UIAlertAction(title: "Đóng", style: .default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.text = "25/04/2022 (Hôm nay)"
        }
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Số tiền: 0 ₫"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

}
