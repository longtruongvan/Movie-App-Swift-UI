//
//  Carousel.swift
//  movieapp
//
//  Created by TruongVanLong on 26/02/2023.
//

import SwiftUI

enum MovieType {
    case mostPopular
    case upComingRelease
}

class CarouselConfig: ObservableObject {
    @Published var cardWidth: CGFloat = 0
    @Published var cardCount: Int = 0
    @Published var selected: Int = 0
}

struct Carousel<Cards: View>: View {
    let cards: Cards

    private var config: CarouselConfig
    private var movieType: MovieType

    @GestureState private var isDetectingLongPress = false

    @State private var offset: CGFloat = 0
    @State private var gestureOffset: CGFloat = 0

    private let spacing: CGFloat
    private let carouselConfig: CarouselConfig
    private let pageSelectedCallback: (Int) -> ()
    init(
        movieType: MovieType,
        cardWidth: CGFloat,
        selected: Int = 0,
        spacing: CGFloat = 20,
        carouselConfig: CarouselConfig,
        pageSelectedCallback: @escaping (Int) -> (),
        @ViewBuilder cards: @escaping () -> Cards
    ) {
        self.config = carouselConfig
        self.config.cardWidth = cardWidth
        self.config.selected = selected

        self.spacing = spacing

        self.cards = cards()
        self.carouselConfig = carouselConfig
        self.pageSelectedCallback = pageSelectedCallback
        self.movieType = movieType
    }

    func offset(for index: Int, geometry: GeometryProxy) -> CGFloat {
        if(self.movieType == MovieType.upComingRelease){
            return ( (geometry.size.width - self.config.cardWidth) / 2 - CGFloat(self.config.selected)
                     * (self.config.cardWidth + spacing)) - self.config.cardWidth
        }
        return (geometry.size.width - self.config.cardWidth) / 2 - CGFloat(self.config.selected)
            * (self.config.cardWidth + spacing)
    }

    var body: some View {
        GeometryReader {
            geometry in
            HStack(alignment: .center, spacing: self.spacing) {
                cards
                    .environmentObject(config)
            }
                .offset(x: offset + gestureOffset)
                .onAppear {
                self.offset = self.offset(for: self.config.selected, geometry: geometry)
            }
                .gesture(
                DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
                    self.gestureOffset = currentState.translation.width

                }.onEnded { value in
                    self.offset += self.gestureOffset
                    self.gestureOffset = 0
                    if value.translation.width < -(geometry.size.width / 6) {
                        self.config.selected = min(self.config.selected + 1, self.config.cardCount - 1)
                    } else if value.translation.width > (geometry.size.width / 6) {
                        self.config.selected = max(0, self.config.selected - 1)
                    }
                    withAnimation(.easeOut(duration: 0.3)) {
                        print("Carousel change: \(self.config.selected)")
                        self.offset = self.offset(for: self.config.selected, geometry: geometry)
                    }
                    pageSelectedCallback(self.config.selected)
                })
        }
    }
}

struct CarouselCard<Content: View>: View {
    @EnvironmentObject var config: CarouselConfig

    let content: Content
    let movieType: MovieType
    @State private var cardId: Int? = nil

    var isActive: Bool {
        // The cards are numbered in reverse order
        return cardId == config.cardCount - config.selected - 1
    }

    init(
        movieType: MovieType,
        @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.movieType = movieType
    }

    var body: some View {
        content
            .cornerRadius(30)
            .frame(width: config.cardWidth)
            .scaleEffect(isActive ? 1 : (movieType == MovieType.mostPopular) ? 0.8 : 1)
            .animation(.easeInOut, value: isActive)
            .zIndex(isActive ? 1 : 0)
            .onAppear {
            self.cardId = self.config.cardCount
            self.config.cardCount += 1
        }.cornerRadius(30)
    }
}

struct Carousel_Previews: PreviewProvider {

    static func testOfClosures (flag: Int, closure1: () -> (), closure2: () -> (), closure3: () -> ())
    {
        switch flag
        {
        case 1:
            closure1()
        case 2:
            closure2()
        default:
            closure3()
        }
    }

    static func test() {
        testOfClosures(flag: 1, closure1: { }, closure2: { }, closure3: { })
    }

    static var previews: some View {
        Carousel(
            movieType: MovieType.mostPopular,
            cardWidth: 200,
            carouselConfig: CarouselConfig(),
            pageSelectedCallback: { result in
                print(result)
            }) {
            CarouselCard (movieType: MovieType.mostPopular) {
                Text("First Card")
                    .frame(width: 200, height: 200)
                    .background(Color.blue)
            }
        }

    }
}
