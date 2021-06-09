//
//  UserManager.swift
//  LoginApp
//
//  Created by Marat Shagiakhmetov on 09.06.2021.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
}
