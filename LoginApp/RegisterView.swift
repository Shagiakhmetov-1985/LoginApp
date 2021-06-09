//
//  RegisterView.swift
//  LoginApp
//
//  Created by Marat Shagiakhmetov on 09.06.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    var body: some View {
        VStack {
            TextField("Enter you name", text: $name)
                .multilineTextAlignment(.center)
                .font(.system(size: 25))
                .frame(width: 350, height: 40)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                ).padding()
            Button(action: registerUser) {
                Text("OK")
                    .font(.system(size: 25))
                    .frame(width: 350, height: 40)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            Text("0")
                .font(.system(size: 25))
                .padding(10)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
