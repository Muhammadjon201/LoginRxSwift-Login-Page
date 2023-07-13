//
//  HomeViewController.swift
//  LoginRxSwift
//
//  Created by ericzero on 7/5/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    lazy var titleLogin: UILabel = {
        let title = UILabel()
        title.text = "Login Successful"
        title.font = UIFont.systemFont(ofSize: 20)
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constraints()
    }
    
    private func constraints(){
        view.addSubview(titleLogin)
        titleLogin.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
        closeButton.tintColor = .systemPink
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func closeButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
   
}
