//
//  ContentView.swift
//  movieapp
//
//  Created by LongTV on 24/02/2023.
//

import SwiftUI

struct ContentView: View {

    @State var searchController: String = ""
    var body: some View {
        ZStack {
            VStack() {
                HStack(spacing: 0) {
                    SwiftUI.Group {
                        Text("Hello,")
                            .foregroundColor(Color.white)
                            .font(.system(size: 18))
                        
                        Text(" Jane!")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18))
                    }
                    Spacer()
                    Image("ic_notification")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 63)

                HStack(spacing: 0) {
                    TextField("Search", text: $searchController)
//                        .modifier(PlaceholderStyle(showPlaceHolder: true, placeholder: "Search"))
                        .padding(.vertical, 14)
                        .background(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color(red: 0.42, green: 0.4, blue: 0.651),
                                        Color(red: 0.459, green: 0.82, blue: 0.867)
                                    ]
                                ),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
//                        .opacity(0.3)
                        .cornerRadius(15)
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, 50)
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
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
