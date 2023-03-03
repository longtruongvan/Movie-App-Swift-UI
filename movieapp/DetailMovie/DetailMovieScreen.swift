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

        NavigationView{
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
                VStack (spacing: 0) {
                    Spacer()
                    VStack (spacing: 0) {
                        Image("bottomSheetIndicator")
                            .frame(width: 24, height: 3)
                            .padding(.top, 17)
                        Text("Thor")
                            .font(.custom("BeVietnamPro-Bold", size: 64))
                            .foregroundColor(.white)
                        Text("The Dark World")
                            .font(.custom("BeVietnamPro-Bold", size: 18))
                            .foregroundColor(.white).opacity(0.5)

                        HStack {
                            Text("Action")
                                .font(.custom("BeVietnamPro-Bold", size: 12))
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(LinearGradient(
                                gradient:
                                    Gradient(
                                    colors: [
                                        Color(red: 0.651, green: 0.631, blue: 0.878),
                                        Color(red: 0.631, green: 0.953, blue: 0.996)
                                    ]
                                ),
                                startPoint: .leading,
                                endPoint: .trailing
                                ).opacity(0.3))
                                .cornerRadius(15)


                            Text("16+")
                                .font(.custom("BeVietnamPro-Bold", size: 12))
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(LinearGradient(
                                gradient:
                                    Gradient(
                                    colors: [
                                        Color(red: 0.651, green: 0.631, blue: 0.878),
                                        Color(red: 0.631, green: 0.953, blue: 0.996)
                                    ]
                                ),
                                startPoint: .leading,
                                endPoint: .trailing
                                ).opacity(0.3))
                                .cornerRadius(15)

                            HStack (alignment: .center) {
                                Text("IMDb")
                                    .font(.custom("BeVietnamPro-Bold", size: 10))
                                    .foregroundColor(.black)


                                Text("9.8".prefix(3))
                                    .font(.custom("BeVietnamPro-Bold", size: 10))
                                    .foregroundColor(.black)
                            }
                                .padding(.horizontal, 9)
                                .padding(.vertical, 5)
                                .background(Color(red: 0.961, green: 0.773, blue: 0.094))
                                .clipShape(RoundedRectangle(cornerRadius: 15))

                            Spacer()

                            Image("icShare")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 14, height: 29)
                                .padding(.leading, 10)


                            Image("icFavorites")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 24, height: 24)
                        }.padding(.horizontal, 50)


                        HStack(alignment: .center, spacing: 0) {
                            Text("When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous and personal journey that will reunite him with doctor Jane ...")
                                .font(.custom("BeVietnamPro-Medium", size: 12))
                                .foregroundColor(.white)
                                .padding(.top, 17)

                            Spacer()
    //                        Text("More")
    //                            .font(.custom("BeVietnamPro-Medium", size: 12))
    //                            .foregroundColor(.white)
                        }.padding(.horizontal, 50)

                        HStack(alignment: .center, spacing: 0) {
                            Text("Cast")
                                .font(.custom("BeVietnamPro-Bold", size: 18))
                                .foregroundColor(.white)
                            Spacer()
                            Text("See All")
                                .font(.custom("BeVietnamPro-Medium", size: 12))
                                .foregroundColor(.white)
                        }
                            .padding(.horizontal, 50)
                            .padding(.top, 20)

                        VStack (spacing: 0){
                            Image("detailMovie")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: 50, maxHeight: 50)
                                .cornerRadius(15)
                            Text("See All")
                                .font(.custom("BeVietnamPro-Medium", size: 8))
                                .foregroundColor(.white)
                                .padding(.top, 9)
                            Text("See All")
                                .font(.custom("BeVietnamPro-Medium", size: 8))
                                .foregroundColor(.white).opacity(0.5)
                                .padding(.top, 3)
                        }
                       
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
