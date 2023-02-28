// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mostPopulars = try? JSONDecoder().decode(MostPopulars.self, from: jsonData)

import Foundation

// MARK: - MostPopulars
struct MostPopulars: Codable {
    let dates: Dates?
    let page: Int
    let results: [MostPopularResponse]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct MostPopularResponse: Codable, Identifiable, Equatable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case it = "it"
//    case ko = "ko"
//    case no = "no"
//    case es = "es"
//}
