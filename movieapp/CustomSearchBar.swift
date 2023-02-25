//
//  CustomSearchBar.swift
//  movieapp
//
//  Created by TruongVanLong on 25/02/2023.
//

import SwiftUI

struct CustomSearchBar: View {
    @State var searchController: String = ""

    var body: some View {
        HStack(spacing: 0) {
            Image("ic_search")
                .resizable()
                .frame(width: 22, height: 22)
                .padding(.leading, 16)
                .padding(.trailing, 11)
                .foregroundColor(.white)

            TextField("", text: $searchController)
                .padding(.vertical, 14)
                .foregroundColor(Color.white)
                .font(.custom("BeVietnamPro-Regular", fixedSize: 18))
                .background(ZStack {
                if(searchController.isEmpty) {
                    // set color text placeholder
                    HStack {
                        Text("Search")
                            .font(.custom("BeVietnamPro-Regular", size: 18))
                            .foregroundColor(.white).opacity(0.5)
                        Spacer()
                    } .frame(maxWidth: .infinity)
                } }
            )

            Image("ic_divider_vertical")
                .resizable()
                .frame(width: 1, height: 35)
                .padding(.leading, 17)
                .foregroundColor(.red)

            Image("ic_micro")
                .resizable()
                .frame(width: 16, height: 22)
                .padding(.leading, 17)
                .padding(.trailing, 17)
                .foregroundColor(.white)

        }.background(
            // background color view group (icon search, textfield, ic divider, ic micro)
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(red: 0.42, green: 0.4, blue: 0.651),
                        Color(red: 0.459, green: 0.82, blue: 0.867)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            ).opacity(0.3)
        )
            .cornerRadius(15)
            .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(
                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
                ), lineWidth: 1
            )
        )
            .padding(.horizontal, 50)
            .padding(.top, 20)

    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar()
    }
}
