import SwiftUI

struct HomeView: View {
    let username: String
    
    var body: some View {
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
