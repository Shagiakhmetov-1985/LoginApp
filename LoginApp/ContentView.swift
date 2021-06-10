//
//  ContentView.swift
//  LoginApp
//
//  Created by Marat Shagiakhmetov on 09.06.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Welcome, \(user.name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 50)
            Text("\(timer.counter)")
                .font(.system(size: 80))
                .offset(x: 0, y: 150)
                .foregroundColor(.blue)
            ButtonStart(timer: timer)
                .offset(x: 0, y: 250)
            ButtonExit()
                .offset(x: 0, y: 280)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonStart: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.system(size: 35))
                .frame(width: 350, height: 60)
        }
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(10)
        .shadow(radius: 15)
    }
}

struct ButtonExit: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Button(action: exitRegisterUser) {
            Text("LogOut")
                .font(.system(size: 35))
                .frame(width: 350, height: 60)
                .foregroundColor(.blue)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                )
                .shadow(radius: 15)
        }
    }
    
    private func exitRegisterUser() {
        user.isRegister.toggle()
    }
}
