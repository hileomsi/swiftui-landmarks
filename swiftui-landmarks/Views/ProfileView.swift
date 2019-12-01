//
//  ProfileView.swift
//  swiftui-landmarks
//
//  Created by Hiléo Andersson on 18/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var locations: [String] = [
        "New York",
        "London",
        "Tokyo",
        "Berlin",
        "Paris"
    ]
    @State var fisrtname: String = ""
    @State var lastname: String = ""
    @State var location: String = ""
    @State var termsAccepted: Bool = false
    @State var age = 20;
    @State var password: String = ""
    @State var confirmedPassword: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Details")) {
                    TextField("Fisrtname", text: $fisrtname)
                    TextField("Lastname", text: $lastname)
                    Picker(selection: $location, label: Text("Location")) {
                        ForEach(locations, id: \.self) { locationName in
                            Text(locationName).tag(locationName)
                        }
                    }
                    Toggle(isOn: $termsAccepted, label: {
                        Text("Accept terms and conditions")
                    })
                    Stepper(value: $age, in: 18...80, label: {
                        Text("Current age: \(self.age)")
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Update Profile")
                    })
                }
                Section(header: Text("Password")) {
                    SecureField("New password", text: $password)
                    SecureField("Confirm new password", text: $confirmedPassword)
                    Button(action: {
                        
                    }, label: {
                        Text("Reset Password")
                    })
                }
            }
            .navigationBarTitle(Text("Profile"))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
