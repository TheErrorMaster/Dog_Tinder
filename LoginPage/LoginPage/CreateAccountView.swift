import SwiftUI

struct CreateAccountView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var link: Bool = false
    
    var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.white,]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Text("Create an Account")
                        .font(.system(size:40,weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, 100)
                    Spacer()
                    Image("hot_dog")
                        .resizable()
                        .frame(width: 190, height: 190, alignment: .bottom)
                        .padding(.top,10)
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
                    .background(Color.yellow)
                }.frame(width: 340)
            }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
