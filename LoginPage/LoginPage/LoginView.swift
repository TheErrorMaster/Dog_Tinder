//
//  Login_page.swift
//  LoginPage
//
//  Created by Mauricio Macias on 3/17/21.
//  Copyright © 2021 Mauricio Macias. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var http: String = ""
    @State var home = false
        
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.white,]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Doggy Mingle")
                    .font(.system(size:40, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 100)
                Spacer()
            }
            VStack {
                    Image(systemName: "heart.text.square.fill")
                        .font(.system(size: 156.0))
                        .padding(.bottom,100)
                    Text("Username:")
                    TextField("Username...", text:$username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.blue).background(Color.green)
                        .autocapitalization(.none)
                    Text("Password:")
                    TextField("Password...", text:$password).textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    NavigationLink(
                    destination: HomeView(username: username), isActive: $home){
                        Button(action: {
                            self.addForm(user:"\(self.username)", pass:"\(self.password)")
                        }) {
                            Text("Login")
                                .font(Font.system(size: 30))
                        }
                    }
    //                NavigationLink(destination: HomeView()) {
    //                    Text("show")
    //                }
                    .padding(.bottom,50)
                    Text("\(http)")
                    NavigationLink(
                        destination: CreateAccountView()){
                            Text("Create Account")
                                .foregroundColor(Color.black)
                                .font(Font.system(size:30))
                    }
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.red)
                }.frame(width: 340)
            }
        }
    }
    
    func addForm(user:String, pass:String) {
        let url = URL(string: "http://localhost:5000/login")!
        var request = URLRequest(url: url)
        let postString = "user=\(user)&num=\(pass)"
        print(postString)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Resonse data string: \n\(dataString)")
                DispatchQueue.main.async {
                    if dataString == "True"{
                        self.home = true
                    } else {
                        self.http = "\(dataString) Cannot be found in our database"
                    }
                    
                }
                return
            }
        }.resume()
    }
    
}


struct SView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: EView()) {
                Text("S")
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct EView: View {
    var body: some View {
//        NavigationView{
//            NavigationLink(destination: HomeView()) {
//                Text("E")
//            }
//        }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
        VStack {
            Text("Messages Goes HERE")
        }
    }
}
