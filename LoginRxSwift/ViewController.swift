//
//  ViewController.swift
//  LoginRxSwift
//
//  Created by ericzero on 7/5/23.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ViewController: UIViewController {
    
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    lazy var VerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.contentMode = .center
        return stack
    }()

    lazy var titleLogin: UILabel = {
        let title = UILabel()
        title.text = "LOGIN"
        title.textColor = .systemPink
        title.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        title.textAlignment = .center
        return title
    }()
    
    lazy var userNameTextF: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Username"
        textF.backgroundColor = .systemGray5
        textF.textAlignment = .center
        return textF
    }()
    
    lazy var nameTextF: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Name"
        textF.backgroundColor = .systemGray5
        textF.textAlignment = .center

        return textF
    }()
    
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = .systemPink
        loginBtn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return loginBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        rxConnect()
        constraints()
    }
    
    private func rxConnect(){
        
        userNameTextF.becomeFirstResponder()
        
        userNameTextF.rx.text.map{ $0 ?? ""}.bind(to: loginViewModel.usernameTextPublishSubject)
            .disposed(by: disposeBag)
        nameTextF.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.nameTextPublishSubject)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid().bind(to: loginBtn.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map{ $0 ? 1 : 0.1}.bind(to: loginBtn.rx.alpha).disposed(by: disposeBag)
        
    }
    
    private func constraints(){
        view.addSubview(VerStack)
        VerStack.addArrangedSubview(titleLogin)
        VerStack.addArrangedSubview(userNameTextF)
        VerStack.addArrangedSubview(nameTextF)
        view.addSubview(loginBtn)
        
        VerStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            //make.bottom.equalToSuperview().offset(-30)
        }
        
        titleLogin.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        userNameTextF.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        nameTextF.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    @objc func loginTapped(){
        let vc = HomeViewController()
        let nc = UINavigationController(rootViewController: vc)
        self.modalPresentationStyle = .fullScreen
        self.present(nc, animated: true)
    }

}

