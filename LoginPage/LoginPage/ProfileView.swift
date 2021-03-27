import SwiftUI

struct ProfileView: View {
    var username: String
    var str: String = "https://http.cat/100"
    
    var body: some View {
        VStack {
            Image(uiImage: str.load())
                .resizable()
            .scaledToFit()
                .frame(width: 350, height: 250)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.red, lineWidth: 5))
            Text("\(username)")
            Text("CSUF, 20")
            HStack{
                Button(action: {}) {
                    VStack{
                        Image(systemName: "person.icloud.fill").foregroundColor(Color.black)
                    Text("UPDATE BIO")
                    }
                }
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red, lineWidth: 1))
                Button(action: {}) {
                    VStack{
                    Image(systemName: "video")
                    Text("UPDATE IMAGE")
                    }
                }
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.white)
                    .background(Color.yellow)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red, lineWidth: 1))
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
