//
//  LandmarkItem.swift
//  swiftui-landmarks
//
//  Created by Hiléo Andersson on 18/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import SwiftUI

struct LandmarkItem: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
            } else {
                Image(systemName: "star")
                    .foregroundColor(Color.gray)
            }
            
        }
    }
}

struct LandmarkItem_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkItem(landmark: landmarkData[0])
    }
}
