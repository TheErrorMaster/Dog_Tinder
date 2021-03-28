import SwiftUI

struct TimelineView: View {
    @ObservedObject var post = WebService()
    var username: String
    
    var body: some View{
        NavigationView {
            List(post.posts) { post in
                VStack {
                    Text(String(post.id))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 40))
                    ZStack(alignment: .bottomLeading) {
                        Image(uiImage: post.thumbnailUrl.load())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .shadow(radius: 3)
                        NavigationLink(destination: UserView(post: post, username: username)) {
                            EmptyView()
                        }
                        Text("\(post.id), \n\(post.id)").foregroundColor(Color.white).padding(20).shadow(radius: 5)
                    }
                    Text("Bio: \(post.title)")
                        .font(.system(size: 30))
                        .foregroundColor(Color.gray)
                        .padding(.bottom,300)
                }
            }
//            .navigationBarTitle("Tinder").navigationBarHidden(false)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
//        .onAppear(){
//            UINavigationBar.appearance().tintColor = .blue
//        }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
    }
}
