import UIKit

func apiCall() {
    // MARK: Api without Authorization
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    // MARK: Api with Authorization - Call Client API
//    guard let url = URL(string: "https://parking-ntn.herokuapp.com/client") else { return }
    
    // MARK: Api with Authorization - Call Parking API
    guard let url = URL(string: "https://parking-ntn.herokuapp.com/parking") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let joined = "user:root"
    let data = Data(joined.utf8)
    let encoded = data.base64EncodedString()
    let Authorization = "Basic \(encoded)"

    request.setValue(Authorization, forHTTPHeaderField: "Authorization")
    request.setValue("*/*", forHTTPHeaderField: "accept")
    
    
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else { return }

        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(response)
        } catch {
            print(error)
        }
    }
    task.resume()
}

 apiCall()
