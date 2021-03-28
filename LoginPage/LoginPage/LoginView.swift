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
    
    @State var hidde = false
        
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.white,]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Doggy Mingle")
                    .font(.system(size:40,weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 100)
                Spacer()
                
                    Image("hot_dog")
                        .resizable()
                        .frame(width: 190, height: 190, alignment: .bottom)
                        .padding(.top,10)
                    Text("Username:")
                    TextField("Username...", text:$username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.black).background(Color.green)
                        .autocapitalization(.none)
                    Text("Password:")
                if self.hidde {
                    TextField("Password...", text: self.$password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)
                } else {
                    SecureField("Password...", text: self.$password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)
                }
                    NavigationLink(
                    destination: HomeView(username: username), isActive: $home){
                        Button(action: {
                            self.addForm(user:"\(self.username)", pass:"\(self.password)")
                        }) {
                            Text("Login")
                                .font(Font.system(size: 35))
                                .foregroundColor(.orange)
                                .padding(.top,20)
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
                    .background(Color.yellow)
                }.frame(width: 340)
            .padding(.bottom,70)
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
