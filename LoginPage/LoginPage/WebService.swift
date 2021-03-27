import SwiftUI

struct Post: Codable, Identifiable {
    public var id: Int
    public var thumbnailUrl: String
    public var title: String
}

class WebService: ObservableObject {
  // 1.
  @Published var posts = [Post]()

    init() {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        let url = URL(string: "http://localhost:5000/getAll")!

        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let data = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        self.posts = decodedData
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
