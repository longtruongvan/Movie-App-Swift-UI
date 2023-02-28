//
//  UpcomingReleaseView.swift
//  movieapp
//
//  Created by TruongVanLong on 28/02/2023.
//

import SwiftUI

struct UpcomingReleaseView: View {
    @State private var currentIndex: Int = 0
    @State private var indexOfCarousel: Int = 0
    @State private var mostPopular: MostPopulars?;
    private let repository = MostPopularRepository()
    private let carouselConfig = CarouselConfig()

    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Upcoming releases")
                .foregroundColor(.white)
                .font(.custom("BeVietnamPro-Bold", size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 50)
                .padding(.bottom, 15)

            Carousel(movieType: MovieType.upComingRelease,
                cardWidth: 145,
                spacing: 19,
                carouselConfig: CarouselConfig(),
                pageSelectedCallback: { result in
                    print(result)
                    indexOfCarousel = result
                    currentIndex = result % 3
                    print("LONGTV: \(currentIndex)")
                }) {
                ForEach(mostPopular?.results ?? [MostPopularResponse]()) { item in

                    CarouselCard(
                        movieType: MovieType.upComingRelease
                    ) {
                        ZStack {
                            AsyncImage(url: URL(string: AppConfigs.imageBaseUrl + item.posterPath)) { image in
                                MovieArtView(
                                    indexOfCarousel:$indexOfCarousel,
                                    mostPopulars:$mostPopular,
                                    item:item,
                                    image: image,
                                    width: 145,
                                    height: 214.71,
                                    movieType: MovieType.upComingRelease
                                )

                            } placeholder: {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .scaleEffect(1.5)
                            }
                                .ignoresSafeArea()

                            BackGoundGradientItemView(
                                indexOfCarousel: $indexOfCarousel,
                                mostPopulars: $mostPopular,
                                item: item,
                                width: 145,
                                height: 214.71
                            )

                        }.frame(width: 145, height: 214.71)

                    }.onTapGesture {
                        
                    }
                }
            }
                .padding(.leading, 100)
                .frame(height: 214.71,alignment: .leading)
//                .padding(.bottom, 17)
                .onAppear() {
                repository.getUpcomingReleases { response in
                    self.mostPopular = response
                } failure: { errorMessage in
                }
            }.navigationTitle("Book List")


            CustomPageIndicator(
                numberOfPages: 3,
                currentIndex: $currentIndex
            )
                .padding(.top, 17.29)
                .frame(maxWidth: .infinity, alignment: .center)
        }.padding(.top, 35)
    }
}

struct UpcomingReleaseView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingReleaseView()
    }
}
