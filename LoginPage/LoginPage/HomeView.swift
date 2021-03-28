import SwiftUI

struct HomeView: View {
    let username: String
    
    var body: some View {
        TabView {
            TimelineView(username: username).tabItem{
                Image(systemName: "house.fill")
                Text("Home \(username)")
            }
            ProfileView(username: username).tabItem{
                Image(systemName: "person")
                Text("Profile")
            }
            MsgView().tabItem{
                Image(systemName: "message")
                Text("Messages")
            }
        }
    }
}


struct MsgView: View {
    @ObservedObject var msg = MessageService(username: "bro")
    
    var body: some View {
        NavigationView {
            List(msg.msgs) { msg in
                VStack {
                    Text(String(msg.id))
                    Text(String(msg.user1))
                    Text(String(msg.user2))
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

