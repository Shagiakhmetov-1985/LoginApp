//
//  LoginAppApp.swift
//  LoginApp
//
//  Created by Marat Shagiakhmetov on 09.06.2021.
//

import SwiftUI

@main
struct LoginAppApp: App {
    @StateObject private var user = UserManager()
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}
