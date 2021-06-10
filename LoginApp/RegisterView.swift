//
//  RegisterView.swift
//  LoginApp
//
//  Created by Marat Shagiakhmetov on 09.06.2021.
//

import SwiftUI

class TextFieldManager: ObservableObject {
    let checkTextLimit = 3
    
    @Published var checkBool = true
    @Published var colorButton = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    @Published var colorLabel = Color.red
    @Published var numberLabel = 0
    @Published var text = "" {
        didSet {
            if text.count >= checkTextLimit {
                checkBool = false
                colorButton = Color.blue
                colorLabel = Color.green
            } else if text.count <= checkTextLimit {
                checkBool = true
                colorButton = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                colorLabel = Color.red
            }
            if text.count >= 0 {
                numberLabel = text.count
            }
        }
    }
}

struct RegisterView: View {
    @ObservedObject private var name = TextFieldManager()
    @State private var number = 0
    @EnvironmentObject var user: UserManager
    var body: some View {
        VStack {
            TextField("Enter you name", text: $name.text)
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
            }
            .foregroundColor(.white)
            .background(name.colorButton)
            .cornerRadius(10)
            .shadow(radius: 10)
            .disabled(name.checkBool)
            Text("\(name.numberLabel)")
                .font(.system(size: 25))
                .padding(10)
                .foregroundColor(name.colorLabel)
        }
    }
    
    private func registerUser() {
        if !name.text.isEmpty {
            user.name = name.text
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
