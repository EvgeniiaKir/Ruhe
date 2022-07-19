//
//  ColorData.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 02.07.2022.
//

import SwiftUI

class ColorData {
    private var LIGHT_COLOR_KEY = "LIGHT_COLOR_KEY"
    private var BASIC_COLOR_KEY = "BASIC_COLOR_KEY"
    private var DARK_COLOR_KEY = "DARK_COLOR_KEY"
    private let userDefaults = UserDefaults.standard
    
    func saveColors(lightColor: Color, basicColor: Color, darkColor: Color) {
        let lightColor = UIColor(lightColor).cgColor
        let basicColor = UIColor(basicColor).cgColor
        let darkColor = UIColor(darkColor).cgColor
        
        if let lightComponents = lightColor.components, let basicComponents = basicColor.components, let darkComponents = darkColor.components {
            userDefaults.set(lightComponents, forKey: LIGHT_COLOR_KEY)
            userDefaults.set(basicComponents, forKey: BASIC_COLOR_KEY)
            userDefaults.set(darkComponents, forKey: DARK_COLOR_KEY)

            print("Colours saved!")
        }
    }
    
    func loadColors() -> [String:Color] {
        guard let lightArray = userDefaults.object(forKey: LIGHT_COLOR_KEY) as? [CGFloat],
              let basicArray = userDefaults.object(forKey: BASIC_COLOR_KEY) as? [CGFloat],
              let darkArray = userDefaults.object(forKey: DARK_COLOR_KEY) as? [CGFloat] else { return Color.mint }

        let lightColor = Color(.sRGB,
                          red: lightArray[0],
                          green: lightArray[1],
                          blue: lightArray[2],
                          opacity: lightArray[3])
        
        let basicColor = Color(.sRGB,
                          red: basicArray[0],
                          green: basicArray[1],
                          blue: basicArray[2],
                          opacity: basicArray[3])
        
        let darkColor = Color(.sRGB,
                          red: darkArray[0],
                          green: darkArray[1],
                          blue: darkArray[2],
                          opacity: darkArray[3])
        
        let colorsArray = ["light": lightColor, "basic": basicColor, "dark": darkColor]
        
        print("Colours loaded!")
        return colorsArray
    }
}
