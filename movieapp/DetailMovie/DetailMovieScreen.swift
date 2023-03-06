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
    var actors: [String] = ["", "", "", "", "", ""]
    @Binding var rootPresenting: Bool
    @Binding var itemClick: MostPopularResponse?
    let repository: MostPopularRepository = MostPopularRepository()
    @State var movieDetail: MovieDetailReponse?
    @State var casts: [Cast]?

    var body: some View {
        VStack (spacing: 0) {
            Spacer()
            BottomSheetView(itemClick: $itemClick, movieDetail: $movieDetail, casts: $casts)
        }.frame(maxWidth: screenWidth, minHeight: screenHeight, maxHeight: screenHeight)
            .background(VStack {
            ZStack(alignment: .top) {
                AsyncImage(url: URL(string: AppConfigs.imageBaseUrl + (itemClick?.posterPath ?? ""))) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(maxWidth: screenWidth, maxHeight: screenHeight, alignment: .top)

                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5)
                }
                    .ignoresSafeArea()

                Image("imgDetailMovieMark")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: screenWidth, maxHeight: screenHeight, alignment: .top)


                BackButtonView(screenWidth: screenWidth, rootPresenting: $rootPresenting)

            }
                .edgesIgnoringSafeArea(.all)

        } .frame(maxWidth: screenWidth, maxHeight: screenHeight, alignment: .top)
        )
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            .onAppear {
            repository.getMovieDetail(movieID: "\(itemClick?.id ?? -1)") { response in
                print(response)
                movieDetail = response
            } failure: { message in
                print(message)
            }

            repository.getMovieCredits(movieID: "\(itemClick?.id ?? -1)") { response in
                print(response)
                casts = response.cast ?? []
            } failure: { message in
                print(message)
            }

        }

    }
}

struct BottomSheetView: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let screenSize = UIScreen.main.bounds.size
    @Binding var itemClick: MostPopularResponse?
    @Binding var movieDetail: MovieDetailReponse?
    @State var isExpanded: Bool = false
    @Binding var casts: [Cast]?

    var body: some View {
        VStack (spacing: 0) {
            Image("bottomSheetIndicator")
                .frame(width: 24, height: 3)
                .padding(.top, 17)

            Text(itemClick?.title.components(separatedBy: ": ").first ?? "")
                .font(.custom("BeVietnamPro-Bold", size: 64))
                .foregroundColor(.white)
                .padding(.horizontal, 20)

            Text(itemClick?.title.components(separatedBy: ": ").last ?? "")
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


                    Text("\(itemClick?.voteAverage ?? 0)".prefix(3))
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
                .padding(.top, 27)


            HStack(alignment: .center, spacing: 0) {
//                Text(itemClick?.overview ?? "")
//                    .font(.custom("BeVietnamPro-Medium", size: 12))
//                    .foregroundColor(.white)
//                    .padding(.top, 17)
//                    .lineLimit(3)
//                    .fixedSize(horizontal: false, vertical: true)
                ReadMoreTextView(collapseText: itemClick?.overview ?? "", expandedText: itemClick?.overview ?? "")

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

            ListViewActor(castssssss: $casts)
                .padding(.horizontal, 50)

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
            width: screenWidth,
            height: screenHeight / 4
        ).padding(.top, 17)
    }
}

struct ListViewActor: View {
    @Binding var castssssss: [Cast]?
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(castssssss ?? []) { item in
                    VStack (spacing: 0) {
                        AsyncImage(url: URL(string: AppConfigs.imageBaseUrl + (item.profilePath ?? ""))) { image in
                            image.resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .cornerRadius(15)

                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(1.5)
                                .frame(width: 50, height: 50)

                        }
                            .ignoresSafeArea()

                        Text(item.name ?? "Unknow")
                            .font(.custom("BeVietnamPro-Medium", size: 8))
                            .foregroundColor(.white)
                            .padding(.top, 9)
                            .frame(width: 50)
                            .lineLimit(3)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)

                        Text(item.character ?? "Unknow")
                            .font(.custom("BeVietnamPro-Medium", size: 8))
                            .foregroundColor(.white).opacity(0.5)
                            .padding(.top, 3)
                            .lineLimit(3)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 50)

                    }
                }
            }
                .padding(.top, 16)
        }
    }
}

struct ReadMoreTextView: View {
    @State var showFullText: Bool = false
    var collapseText: String
    var expandedText: String

    var body: some View {
        Text("\(collapseText)...".add(value: "more"))
            .lineLimit(showFullText ? 3 : 200)
            .fixedSize(horizontal: false, vertical: true)
            .font(.custom("BeVietnamPro-Medium", size: 12))
            .foregroundColor(.white)
            .padding(.top, 17)
    }
}

struct BackButtonView: View {
    let screenWidth: Double
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var rootPresenting: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("icBack")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 24, maxHeight: 24)
                .foregroundColor(.red)
                .padding(.top, 54)
                .padding(.leading, 50).onTapGesture {
                self.presentationMode.wrappedValue.dismiss()
                self.rootPresenting = false
            }
        }
            .frame(
            maxWidth: screenWidth,
            alignment: .leading
        )
    }
}

struct DetailMovieScreen_Previews: PreviewProvider {
    @State private var rootPresenting: Bool = false

    static var previews: some View {
        Text("")
    }
}
