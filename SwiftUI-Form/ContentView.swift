//
//  ContentView.swift
//  SwiftUI-Form
//
//  Created by Caner Çağrı on 10.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var shouldSendNewsletter = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")
                    .bold()) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                    }
                
                Section(header: Text("Actions")
                    .bold()) {
                        Toggle("Send Newsletter", isOn: $shouldSendNewsletter)
                            .toggleStyle(SwitchToggleStyle(tint: .red))
                        Stepper("Number Of Likes", value: $numberOfLikes, in: 1...100)
                        Text("Account has \(numberOfLikes) likes")
                        Link("Terms Of Service", destination: URL(string: "https://www.linkedin.com/in/caner-cagri")!)
                    }
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    Button("SAVE", action: saveUser)
                }
            }
        }
        .accentColor(.red)
    }
    
    private func saveUser() {
        print("User saved")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
