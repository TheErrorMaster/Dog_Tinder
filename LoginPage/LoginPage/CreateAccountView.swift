import SwiftUI

struct CreateAccountView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var link: Bool = false
    
    var body: some View {
            ZStack{
                Color.secondary.edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "message")
                        .font(.system(size: 156.0))
                        .padding(.bottom,100)
                    Text("Username")
                    TextField("Username...", text:$username).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(Color.blue).background(Color.green)
                    Text("Password")
                    TextField("Password...", text:$password).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("your Username: \(username)")
                    NavigationLink(
                    destination: LoginView()){Text("back")}
                    .padding(.bottom,50)
                    NavigationLink(
                        destination: LoginView(), isActive: $link){
                            Button(action: {
                                self.link = true
                            }){
                                Text("Login")
                                    .foregroundColor(Color.black)
                                    .font(Font.system(size:30))
                            }
                    }
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.red)
                }.frame(width: 340)
            }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
