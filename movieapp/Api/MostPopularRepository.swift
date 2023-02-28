//
//  MostPopularRepository.swift
//  movieapp
//
//  Created by LongTV on 28/02/2023.
//

import Foundation

class MostPopularRepository: ObservableObject {

    func getMoviePopulars(success: @escaping (MostPopulars) -> (), failure: @escaping (String) -> ()) {

        var url = ApiConfig.baseUrl + "/movie/popular"
        var urlComponent = URLComponents(string: url)
        let apiKey = URLQueryItem(name: "api_key", value: ApiConfig.apiKey)
        let page = URLQueryItem(name: "page", value: "1")
        let language = URLQueryItem(name: "language", value: "en-US")
        urlComponent?.queryItems = [apiKey, page, language]
        
        var request = URLRequest(url: urlComponent!.url!)
        request.httpMethod = "GET"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OGY2ODkwMDc0NTc3MWY2ZmJhY2VmOGViMjM5ZDBlNCIsInN1YiI6IjYzZmQ2N2JhY2Y2MmNkMDBiMjBkMjkwYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S6qjpWCHlI5hAmafoqHzKUGcKTuGg4-oqNu6iYnO74E", forHTTPHeaderField: "authorization")
        

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if(error != nil) {
                DispatchQueue.main.async {
                    failure(error.debugDescription)
                }
                return
            }

            print(response)

            do {
                let result = try JSONDecoder().decode(MostPopulars.self, from: data!)
                DispatchQueue.main.async {
                    success(result)
                }
                return
            } catch {
                print("JSON error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    failure(error.localizedDescription)
                }
                return
            }

        }; task.resume()
    }
}
