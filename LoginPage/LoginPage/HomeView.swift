import SwiftUI

struct HomeView: View {
    let username: String
        var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.white,]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                TabView {
            TimelineView().tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            ProfileView(username: username).tabItem{
                Image(systemName: "person")
                Text("Profile")
            }
            EView().tabItem{
                Image(systemName: "message")
                Text("Messages")
            }
        }
    }
}
}
