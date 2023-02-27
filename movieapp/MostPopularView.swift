//
//  MostPopularView.swift
//  movieapp
//
//  Created by TruongVanLong on 25/02/2023.
//

import SwiftUI

struct MostPopularView: View {
    @State private var currentIndex = 0

    var body: some View {
        VStack(spacing: 0) {
            Text("Most Popular")
                .font(.custom("BeVietnamPro-Bold", size: 18))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 15)
                .padding(.top, 26)
                .padding(.leading, 50)

            Carousel(cardWidth: 328, spacing: -14) {
                CarouselCard {
                    ZStack {
                        Image("fantasticFour")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 328, height: 141)
                            .opacity(0.5)

                        Image("img_mark_movie")

                        HStack {
                            Text("Deadpool 2")
                                .font(.custom("BeVietnamPro-Bold", size: 18))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                                .padding(.leading, 26)

                            Spacer()

                            HStack (alignment: .center) {
                                Text("IMDb")
                                    .font(.custom("BeVietnamPro-Bold", size: 10))
                                    .foregroundColor(.black)


                                Text("8.5")
                                    .font(.custom("BeVietnamPro-Bold", size: 10))
                                    .foregroundColor(.black)
                            }
                                .padding(.horizontal, 5.25)
                                .padding(.vertical, 3)
                                .background(Color.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.bottom, 15)
                                .padding(.trailing, 26)
                        }
                            .frame(width: 328, height: 141, alignment: .bottomLeading)
                        
                        Text("")
                            .frame(width: 328, height: 141)
                            .background(
                            LinearGradient(
                                gradient:
                                    Gradient(
                                    colors: [
                                        Color(red: 0.392, green: 0.671, blue: 0.859, opacity: 0.5),
                                        Color(red: 0.51, green: 0.431, blue: 0.784, opacity: 0.1)
                                    ]
                                ),
                                startPoint: .leading,
                                endPoint: .top
                            )
                        )

                    }.frame(width: 328, height: 141)

                }
                CarouselCard {
                    ZStack {
                        Image("deadpool")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 328, height: 141)


                        Image("img_mark_movie")

                        HStack {
                            Text("Deadpool 2")
                                .font(.custom("BeVietnamPro-Bold", size: 18))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                                .padding(.leading, 26)

                            Spacer()

                            HStack (alignment: .center) {
                                Text("IMDb")
                                    .font(.custom("BeVietnamPro-Bold", size: 10))
                                    .foregroundColor(.black)


                                Text("8.5")
                                    .font(.custom("BeVietnamPro-Bold", size: 10))
                                    .foregroundColor(.black)
                            }
                                .padding(.horizontal, 5.25)
                                .padding(.vertical, 3)
                                .background(Color.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.bottom, 15)
                                .padding(.trailing, 26)
                        }
                            .frame(width: 328, height: 141, alignment: .bottomLeading)
                    }.frame(width: 328, height: 141)
                }
                CarouselCard {
                    ZStack {
                        Image("fantasticFour")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 328, height: 141)
                            .opacity(0.5)

                        Image("img_mark_movie")

                        HStack {
                            Text("Deadpool 2")
                                .font(.custom("BeVietnamPro-Bold", size: 18))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                                .padding(.leading, 26)

                            Spacer()

                            HStack (alignment: .center) {
                                Text("IMDb")
                                    .font(.custom("BeVietnamPro-Bold", size: 10))
                                    .foregroundColor(.black)


                                Text("8.5")
                                    .font(.custom("BeVietnamPro-Bold", size: 10))
                                    .foregroundColor(.black)
                            }
                                .padding(.horizontal, 5.25)
                                .padding(.vertical, 3)
                                .background(Color.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.bottom, 15)
                                .padding(.trailing, 26)
                        }
                            .frame(width: 328, height: 141, alignment: .bottomLeading)
                        
                        Text("")
                            .frame(width: 328, height: 141)
                            .background(
                            LinearGradient(
                                gradient:
                                    Gradient(
                                    colors: [
                                        Color(red: 0.392, green: 0.671, blue: 0.859, opacity: 0.5),
                                        Color(red: 0.51, green: 0.431, blue: 0.784, opacity: 0.1)
                                    ]
                                ),
                                startPoint: .leading,
                                endPoint: .top
                            )
                        )

                    }.frame(width: 328, height: 141)

                }

            }.frame(height: 141).padding(.bottom,17)
            
            CustomPageIndicator(numberOfPages: 3, currentIndex: 1)
        }
            .frame(maxWidth: .infinity, alignment: .leading)

    }
}

struct CustomPageIndicator: View {
    let numberOfPages: Int
    let currentIndex: Int
    private let circleSize: CGFloat = 16
    private let circleSpacing: CGFloat = 12

    private let primaryColor = Color.white
    private let secondaryColor = Color.white.opacity(0.6)

    private let smallScale: CGFloat = 0.6

    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages) { index in // 1
                if shouldShowIndex(index) {
                    Circle()
                        .fill(currentIndex == index ? primaryColor : secondaryColor) // 2
                    .scaleEffect(currentIndex == index ? 1 : smallScale)

                        .frame(width: circleSize, height: circleSize)

                        .transition(AnyTransition.opacity.combined(with: .scale)) // 3

                        .id(index) // 4
                }
            }
        }
    }

    func shouldShowIndex(_ index: Int) -> Bool {
        ((currentIndex - 1)...(currentIndex + 1)).contains(index)
    }
}

struct MostPopularView_Previews: PreviewProvider {
    static var previews: some View {
        MostPopularView()
    }
}
