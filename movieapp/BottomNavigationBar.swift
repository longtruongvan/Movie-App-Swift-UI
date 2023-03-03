//
//  BottomNavigationBar.swift
//  movieapp
//
//  Created by TruongVanLong on 01/03/2023.
//

import SwiftUI

enum BottomNavTab: String {
    case home = "Home"
    case favorite = "Favorite"
    case ticket = "Ticket"
    case account = "Account"
    case shuffle = "Shuffle"
}

struct BottomNavigationBar: View {
    @State var currentTab: BottomNavTab = .home
    @State var currentIndex = 0

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Group {
                Spacer()

                ZStack {

                    Image("icHome")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 29, height: 29)
                        .padding(.vertical, 25)
                        .foregroundColor(.white)
                        .onTapGesture {
                        self.currentIndex = 0
                    }

                    Image(currentIndex == 0 ? "icDot" : "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 6, height: 6)
                        .padding(.top, 33)
                }

                Spacer()

                ZStack {
                    Image("icFavorites")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 29, height: 29)
                        .padding(.vertical, 25)
                        .foregroundColor(.white)
                        .onTapGesture {
                        self.currentIndex = 1
                    }

                    Image(currentIndex == 1 ? "icDot" : "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 6, height: 6)
                        .padding(.top, 33)
                }

                Spacer()
            }

            Group {
                ZStack {
                    Image("icTicket")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 29, height: 29)
                        .padding(.vertical, 25)
                        .foregroundColor(.white)
                        .onTapGesture {
                        self.currentIndex = 2
                    }

                    Image(currentIndex == 2 ? "icDot" : "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 6, height: 6)
                        .padding(.top, 33)
                }

                Spacer()

                ZStack {
                    Image("icAccount")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 29, height: 29)
                        .padding(.vertical, 25)
                        .foregroundColor(.white)
                        .onTapGesture {
                        self.currentIndex = 3
                    }

                    Image(currentIndex == 3 ? "icDot" : "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 6, height: 6)
                        .padding(.top, 33)
                }

                Spacer()

                ZStack {
                    Image("icShuffle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 34, height: 34)
                        .padding(.vertical, 25)
                        .foregroundColor(.white)
                        .onTapGesture {
                        self.currentIndex = 4
                    }

                    Image(currentIndex == 4 ? "icDot" : "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 6, height: 6)
                        .padding(.top, 33)
                }

                Spacer()
            }

        }
            .frame(maxWidth: .infinity)
            .background(
            LinearGradient(
                gradient:
                    Gradient(
                    colors: [
                        Color(red: 0.42, green: 0.4, blue: 0.651),
                        Color(red: 0.459, green: 0.82, blue: 0.867)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            ).opacity(0.3)
                .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(
                    Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
                    ), lineWidth: 1.2
                )
            )
        )
    }
}

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBar()
    }
}
