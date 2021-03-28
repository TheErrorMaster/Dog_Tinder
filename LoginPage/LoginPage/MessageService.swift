import SwiftUI

struct Message: Codable, Identifiable {
    public var id: Int
    public var user1: String
    public var user2: String
}

class MessageService: ObservableObject {
  // 1.
  @Published var msgs = [Message]()

    init(username: String) {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        let url = URL(string: "http://localhost:5000/getChat")!

        
        var request = URLRequest(url: url)
        let postString = "username=\(username)"
        print(postString)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let data = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Message].self, from: data)
                    DispatchQueue.main.async {
                        self.msgs = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
