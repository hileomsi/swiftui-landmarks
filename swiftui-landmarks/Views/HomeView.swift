//
//  HomeView.swift
//  swiftui-landmarks
//
//  Created by Hiléo Andersson on 18/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    var featured: [Landmark] {
        landmarkData.filter({ $0.isFeatured })
    }
    
    @State var profileOpened: Bool = false
    @EnvironmentObject var userData: UserData

    var profileButton: some View {
        Button(action: {
            self.profileOpened.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                    .listRowInsets(EdgeInsets())
                NavigationLink(destination: LandmarksView()) {
                    Text("See all")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $profileOpened) {
                ProfileView()
            }
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
