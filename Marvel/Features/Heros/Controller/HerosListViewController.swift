//
//  ViewController.swift
//  Marvel
//
//  Created by Vitor Spessoto on 07/02/22.
//

import UIKit

class HerosListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension HerosListViewController: HerosListViewModelDelegate {
    func onSuccess() {
        
    }
    
    func onFailure(error: Error) {
        
    }
}

