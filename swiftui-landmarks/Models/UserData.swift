//
//  UserData.swift
//  swiftui-landmarks
//
//  Created by Hiléo Andersson on 18/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
