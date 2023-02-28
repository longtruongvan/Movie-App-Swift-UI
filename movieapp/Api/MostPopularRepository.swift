//
//  MostPopularRepository.swift
//  movieapp
//
//  Created by LongTV on 28/02/2023.
//

import Foundation

class MostPopularRepository: ObservableObject {

    func loadData(completion: @escaping (MostPopularResponse) -> ()) {
        guard let url = URL(string: "\(ApiConfig.baseUrl)/account/\(ApiConfig.accountId)/movie/recommendations?page=1") else {
            print("Invalid url...")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OGY2ODkwMDc0NTc3MWY2ZmJhY2VmOGViMjM5ZDBlNCIsInN1YiI6IjYzZmQ2N2JhY2Y2MmNkMDBiMjBkMjkwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6qjpWCHlI5hAmafoqHzKUGcKTuGg4-oqNu6iYnO74E", forHTTPHeaderField: "authorization")

//        URLSession.shared.dataTask(with: url) { data, response, error in
//            var mostPopular = try? JSONDecoder().decode(MostPopularResponse.self, from: data!)
//            print(mostPopular)
//            DispatchQueue.main.async {
//                completion(mostPopular!)
//            }
//        }.resume()


        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let response = response { print(response) }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let mostPopular = try JSONDecoder().decode(MostPopularResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(mostPopular)
                    }
                } catch {
                    print(error)
                }
            }
        }; task.resume()
    }
}
