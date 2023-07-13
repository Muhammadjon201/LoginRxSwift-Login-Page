//
//  TextFViewModel.swift
//  LoginRxSwift
//
//  Created by ericzero on 7/5/23.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let nameTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(usernameTextPublishSubject.asObservable(), nameTextPublishSubject.asObservable().startWith("")).map { username, password in
            return username.count > 3 && password.count > 3 
        }.startWith(false)
    }
}
