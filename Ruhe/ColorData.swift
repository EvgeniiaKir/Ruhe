//
//  ColorData.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 02.07.2022.
//

import SwiftUI

class ColorData {
    private var EXTRA_LIGHT_COLOR_KEY = "EXTRA_LIGHT_COLOR_KEY"
    private var LIGHT_COLOR_KEY = "LIGHT_COLOR_KEY"
    private var BASIC_COLOR_KEY = "BASIC_COLOR_KEY"
    private var DARK_COLOR_KEY = "DARK_COLOR_KEY"
    private let userDefaults = UserDefaults.standard
    
    func saveColors(extraLightColor: Color, lightColor: Color, basicColor: Color, darkColor: Color) {
        let extraLightColor = UIColor(extraLightColor).cgColor
        let lightColor = UIColor(lightColor).cgColor
        let basicColor = UIColor(basicColor).cgColor
        let darkColor = UIColor(darkColor).cgColor
        
        if let extraLightComponents = extraLightColor.components, let lightComponents = lightColor.components, let basicComponents = basicColor.components, let darkComponents = darkColor.components {
            userDefaults.set(extraLightComponents, forKey: EXTRA_LIGHT_COLOR_KEY)
            userDefaults.set(lightComponents, forKey: LIGHT_COLOR_KEY)
            userDefaults.set(basicComponents, forKey: BASIC_COLOR_KEY)
            userDefaults.set(darkComponents, forKey: DARK_COLOR_KEY)

            print("Colours saved!")
        }
    }
    
    func loadColors() -> [String:Color] {
        guard let extraLightArray = userDefaults.object(forKey: EXTRA_LIGHT_COLOR_KEY) as? [CGFloat],
              let lightArray = userDefaults.object(forKey: LIGHT_COLOR_KEY) as? [CGFloat],
              let basicArray = userDefaults.object(forKey: BASIC_COLOR_KEY) as? [CGFloat],
              let darkArray = userDefaults.object(forKey: DARK_COLOR_KEY) as? [CGFloat] else { return Color.mint }

        let extraLightColor = getColor(array: extraLightArray)
        let lightColor = getColor(array: lightArray)
        let basicColor = getColor(array: basicArray)
        let darkColor = getColor(array: darkArray)
        
        let colorsArray = ["extraLight": extraLightColor, "light": lightColor, "basic": basicColor, "dark": darkColor]
        
        print("Colours loaded!")
        return colorsArray
    }
    
    func getColor(array: [CGFloat]) -> Color {
        let color = Color(.sRGB,
                          red: array[0],
                          green: array[1],
                          blue: array[2],
                          opacity: array[3])
        return color
    }
}
