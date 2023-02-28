//
//  MostPopularView.swift
//  movieapp
//
//  Created by TruongVanLong on 25/02/2023.
//

import SwiftUI

struct MostPopularView: View {
    @State private var currentIndex: Int = 0
    @State private var mostPopular: MostPopulars?;
    private let repository = MostPopularRepository()
    private let carouselConfig = CarouselConfig()
    var body: some View {
        VStack(spacing: 0) {
            Text("Most Popular")
                .font(.custom("BeVietnamPro-Bold", size: 18))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 15)
                .padding(.top, 26)
                .padding(.leading, 50)



            Carousel(cardWidth: 328, spacing: -14, carouselConfig: CarouselConfig(), pageSelectedCallback: { result in
                    print(result)
                    currentIndex = result % 3
                    print("LONGTV: \(currentIndex)")
                }) {
                ForEach(mostPopular?.results ?? [MostPopularResponse]()) { item in
                    CarouselCard {
                        ZStack {
                            AsyncImage(url: URL(string: AppConfigs.imageBaseUrl + item.backdropPath)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 328, height: 141)
                                    .opacity(0.5)
                                
                            } placeholder: {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .scaleEffect(1.5)
                            }
                                .ignoresSafeArea()

                            Image("img_mark_movie")

                            HStack {
                                Text(item.title)
                                    .font(.custom("BeVietnamPro-Bold", size: 18))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 15)
                                    .padding(.leading, 26)

                                Spacer()

                                HStack (alignment: .center) {
                                    Text("IMDb")
                                        .font(.custom("BeVietnamPro-Bold", size: 10))
                                        .foregroundColor(.black)


                                    Text("\(item.voteAverage)".prefix(3))
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
                }
            }
                .frame(height: 141)
                .padding(.bottom, 17)
                .onAppear() {
                repository.getMoviePopulars { response in
                    self.mostPopular = response
                } failure: { errorMessage in

                }


            }.navigationTitle("Book List")

            CustomPageIndicator(numberOfPages: 3, currentIndex: $currentIndex)
        }
            .frame(maxWidth: .infinity, alignment: .leading)

    }
}

struct CustomPageIndicator: View {
    let numberOfPages: Int
    @Binding var currentIndex: Int
    private let circleSize: CGFloat = 8
    private let circleSpacing: CGFloat = 5

    private let smallScale: CGFloat = 0.6

    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages) { index in // 1
                HStack {
                    Text("")
                }
                    .frame(width: circleSize, height: circleSize)
                    .cornerRadius(circleSize / 2)
                    .background(
                    LinearGradient(
                        colors: [
                            Color(red: 0.392, green: 0.671, blue: 0.859),
                            Color(red: 0.51, green: 0.431, blue: 0.784)
                        ],
                        startPoint: .leading,
                        endPoint: .top
                    ).opacity(currentIndex == index ? 1 : 0.3))
                    .transition(AnyTransition.opacity.combined(with: .scale))
                    .id(index)
                    .cornerRadius(circleSize / 2)
            }
        }
    }
}

struct MostPopularView_Previews: PreviewProvider {
    static var previews: some View {
        MostPopularView()
    }
}
