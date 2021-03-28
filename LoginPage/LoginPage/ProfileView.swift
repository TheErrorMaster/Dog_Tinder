import SwiftUI

struct ProfileView: View {
    var username: String
    var str: String = "https://http.cat/100"
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.white,]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("My Profile")
                    .font(.system(size:40, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 50)
                Spacer()
            }
            VStack {
            Image(uiImage: str.load())
                .resizable()
                .frame(width: 300, height: 250)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 10)
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
            Text("\(username)")
                .font(.system(size:35, weight: .medium, design: .default))
            Text("School: CSUF   Age: 20")
                .font(.system(size:25, weight: .medium, design: .default))
            HStack{
                Button(action: {}) {
                    VStack{
                        Image(systemName: "pencil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    Text("UPDATE BIO")
                    }
                }
                    .frame(width: 125, height: 125)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: 10)
                Button(action: {}) {
                    VStack{
                    Image(systemName: "video")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    Text("UPDATE IMAGE")
                    }
                }
                    .frame(width: 125, height: 125)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: 10)
                    
            }
        }
        
    }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// makes image link to url
extension String {
    
    func load() -> UIImage {
        
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
            
        } catch {
            
        }
        return UIImage()
    }
}

