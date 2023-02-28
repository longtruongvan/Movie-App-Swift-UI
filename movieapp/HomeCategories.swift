//
//  HomeCategories.swift
//  movieapp
//
//  Created by TruongVanLong on 28/02/2023.
//

import SwiftUI

enum TypeCategory: String {
    case genres = "Genres"
    case tvSeries = "TV series"
    case movies = "Movies"
    case inTheate = "In Theatre"
}

struct HomeCategories: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ItemCategory(type: TypeCategory.genres)
                .padding(.trailing, 18)
            ItemCategory(type: TypeCategory.tvSeries)
                .padding(.trailing, 18)
            ItemCategory(type: TypeCategory.movies)
                .padding(.trailing, 18)
            ItemCategory(type: TypeCategory.inTheate)
        }
            .padding(.top, 20)

    }
}

struct ItemCategory: View {
    let type: TypeCategory

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(getIconCategory(type: type))
                .resizable()
                .scaledToFill()
                .frame(width: 31, height: 31)

            Text(type.rawValue)
                .padding(.top, 11)
                .font(.custom("BeVietnamPro-Regular", size: 9))
                .foregroundColor(.white)
        }
            .frame(width: 69, height: 95, alignment: .center)
            .background(
            LinearGradient(
                gradient:
                    Gradient(
                    colors: [
                        Color(red: 0.651, green: 0.631, blue: 0.878),
                        Color(red: 0.631, green: 0.953, blue: 0.996)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            ).opacity(0.3)
        )
            .cornerRadius(15)
            .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(
                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
                     ), lineWidth: 1.5
            ))
    }

    func getIconCategory(type: TypeCategory) -> String {
        switch type {
        case .genres:
            return "categoryGenres"
        case .tvSeries:
            return "categoryTvSeries"
        case .movies:
            return "categoryMovies"
        case .inTheate:
            return "categoryInTheate"
        }
    }

    struct HomeCategories_Previews: PreviewProvider {
        static var previews: some View {
            HomeCategories()
        }
    }
}
