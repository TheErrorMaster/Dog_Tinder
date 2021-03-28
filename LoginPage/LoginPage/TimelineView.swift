//
//  TimelineView.swift
//  LoginPage
//
//  Created by Mauricio Macias on 3/18/21.
//  Copyright © 2021 Mauricio Macias. All rights reserved.
//

import SwiftUI

struct TimelineView: View {
    @ObservedObject var post = WebService()
    var body: some View{
            NavigationView {
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.white,]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            List(post.posts) { post in
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.white,]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Text(String(post.id))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 40))
                    ZStack(alignment: .bottomLeading) {
                        Image(uiImage: post.thumbnailUrl.load())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .shadow(radius: 3)
                        NavigationLink(destination: UserView(post: post)) {
                            EmptyView()
                        }
                        Text("\(post.id), \n\(post.title)").foregroundColor(Color.white).padding(20).shadow(radius: 5)
                    }
                    Text("About \(post.title): ")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                       
                    Text("Tap to message")
                        .font(.system(size:20))
                        .foregroundColor(Color.orange)
                        .padding(.top,10)
                }
            }
            }
                }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//            .navigationBarTitle("Tinder").navigationBarHidden(false)
        }
//        .onAppear(){
//            UINavigationBar.appearance().tintColor = .blue
//        }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
