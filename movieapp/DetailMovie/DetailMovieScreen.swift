//
//  DetailMovieScreen.swift
//  movieapp
//
//  Created by TruongVanLong on 01/03/2023.
//

import SwiftUI

struct DetailMovieScreen: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let screenSize = UIScreen.main.bounds.size

    var body: some View {

        ZStack(alignment: .top) {
            Image("detailMovie")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: screenWidth, maxHeight: screenHeight, alignment: .top)
            Image("imgDetailMovieMark")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: screenWidth, maxHeight: screenHeight, alignment: .top)
            

            BackButtonView(screenWidth: screenWidth)
            Text("").frame(width: screenWidth, height: screenHeight)
            VStack {
                Spacer()
                VStack {
                    Image("bottomSheetIndicator")
                        .frame(width: 24, height: 3)
                        .padding(.top, 17)
                    Text("Thor")
                    Text("Thor")
                    Text("Thor")
                    Text("Thor")
                    Text("Thor")

                    Image("")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: screenWidth, maxHeight: screenHeight, alignment: .bottom)

                }.background(
                    LinearGradient(
                        gradient:
                            Gradient(
                            colors: [
                                Color("gradientColorStart"),
                                Color("gradientColorEnd")
                            ]
                        ),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                        .cornerRadius(30)
                        .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(
                            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
                            ), lineWidth: 2
                        )
                    )
                )
                    .frame(
                    maxWidth: screenWidth,
                    minHeight: screenHeight / 3,
                    maxHeight: screenHeight / 3
                ).padding(.top, 17)
            }.frame(maxWidth: screenWidth, minHeight: screenHeight, maxHeight: screenHeight)
        }
    }
}

struct BackButtonView: View {
    let screenWidth: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("icBack")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 24, maxHeight: 24)
                .foregroundColor(.red)
                .padding(.top, 54)
                .padding(.leading, 50)
        }
            .frame(
            maxWidth: screenWidth,
            alignment: .leading
        )
    }
}

struct DetailMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieScreen()
    }
}
