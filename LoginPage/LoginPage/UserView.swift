import SwiftUI

struct UserView: View {
    let post: Post
    var username: String
    @State var showAlert = false
    @State var sent = "message not sent"
    
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
            
//            NavigationLink(destination: MessageView(user1: post.title, user2: username) , isActive: $isLinkActive) {
//                Button(action: {
//                    self.isLinkActive = true
//                }) {
//                    Text("Message")
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(lineWidth: 2)
//                    )
//                }
//            }
            Button(action: {
                self.addChat(user1: post.title, user2: username)
                self.showAlert.toggle()
            }) {
                Text("Message")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
            }
        }
        .alert(isPresented: $showAlert) { () -> Alert in
            Alert(title: Text("\(sent)!"))
                }
        
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//        }.navigationBarTitle(Text("")).navigationBarHidden(false)
//        }.navigationBarTitle(Text("\(post.title)")).navigationBarHidden(false)
    }
    func addChat(user1:String, user2:String) {
        let url = URL(string: "http://localhost:5000/chat")!
        var request = URLRequest(url: url)
        let postString = "user1=\(user1)&user2=\(user2)"
        print(postString)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Resonse data string: \n\(dataString)")
                DispatchQueue.main.async {
                    if dataString == "True"{
                        self.sent = "message sent"
                    }
                }
                return
            }
        }.resume()
    }
}

//struct MessageView: View {
//    var user1: String
//    var user2: String
//
//    var body: some View {
//        VStack{
//            Text(user1)
//            Text(user2)
//            Text("message sent")
//            Image(systemName: "checkmark.icloud.fill")
//        }
////        .navigationBarTitle("")
////        .navigationBarHidden(true)
//    }
//}

