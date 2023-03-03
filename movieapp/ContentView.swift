//
//  ContentView.swift
//  movieapp
//
//  Created by LongTV on 24/02/2023.
//

import SwiftUI

struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Text("").frame(width: screenWidth, height: screenHeight)
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            SwiftUI.Group {
                                Text("Hello,")
                                    .foregroundColor(Color.white)
                                    .font(.custom("BeVietnamPro-Black", fixedSize: 18))

                                Text(" Jane!")
                                    .fontWeight(.black)
                                    .foregroundColor(Color.white)
                                    .font(
                                        .custom("BeVietnamPro-Bold", fixedSize: 18)
                                )
                            }
                            Spacer()
                            Image("ic_notification")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 63)

                        CustomSearchBar()
                        MostPopularView()
                        HomeCategories()
                        UpcomingReleaseView()
                    }
                        .frame(maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .top
                    )
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
                )
            }
            VStack{
                BottomNavigationBar()
            }.frame(width: screenWidth, height: screenHeight, alignment: .bottom)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .padding(.horizontal, 15)
                    .foregroundColor(Color.white)
            }
            content
                .foregroundColor(Color.white)
                .padding(5.0)
        }
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = { _ in }
    var commit: () -> () = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
