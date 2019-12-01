//
//  LandmarksView.swift
//  swiftui-landmarks
//
//  Created by Hiléo Andersson on 18/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import SwiftUI

struct LandmarksView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
            }
            ForEach(self.userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandmarkDetailsView(landmark: landmark)) {
                        LandmarkItem(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

struct LandmarksView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarksView()
            .environmentObject(UserData())
    }
}
