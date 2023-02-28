//
//  UpcomingReleaseView.swift
//  movieapp
//
//  Created by TruongVanLong on 28/02/2023.
//

import SwiftUI

struct UpcomingReleaseView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Upcoming releases")
                .foregroundColor(.white)
                .font(.custom("BeVietnamPro-Bold", size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 50)
        }.padding(.top, 35)
    }
}

struct UpcomingReleaseView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingReleaseView()
    }
}
