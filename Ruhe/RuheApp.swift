//
//  RuheApp.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 22.04.2022.
//

import SwiftUI

@main
struct RuheApp: App {
    @State var lightColor = Color.mint["light"]
    @State var basicColor = Color.mint["basic"]
    @State var darkColor = Color.mint["dark"]

    var body: some Scene {
        WindowGroup {
            MainView(lightColor: $lightColor, basicColor: $basicColor, darkColor: $darkColor)
                .preferredColorScheme(.light)
        }
    }
}
