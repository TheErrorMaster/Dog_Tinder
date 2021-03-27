//
//  UserView.swift
//  LoginPage
//
//  Created by Mauricio Macias on 3/18/21.
//  Copyright © 2021 Mauricio Macias. All rights reserved.
//

import SwiftUI

struct UserView: View {
    let post: Post
    @State var isLinkActive = false

    var body: some View {
        VStack(alignment: .leading){
            Image(uiImage: post.thumbnailUrl.load())
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 250)
                .shadow(radius: 3)
                .padding(.bottom, 20)
//            NavigationLink(destination: Create_message(post:post) , isActive: $isLinkActive) {
            NavigationLink(destination: Text("hello") , isActive: $isLinkActive) {
                Button(action: {
                    self.isLinkActive = true
                }) {
                    Text("Message")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                }
            }
            Spacer()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
//        }.navigationBarTitle(Text("")).navigationBarHidden(false)
//        }.navigationBarTitle(Text("\(post.title)")).navigationBarHidden(false)
    }
}
