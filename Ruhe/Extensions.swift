//
//  Extensions.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 23.04.2022.
//

import Combine
import SwiftUI

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {

        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension Color {
    
    public static var mint: [String: Color] {
        let extraLight = Color(red: 177/255, green: 209/255, blue: 212/255)
        let light = Color(red: 148/255, green: 192/255, blue: 194/255)
        let basic = Color(red: 102/255, green: 154/255, blue: 154/255)
        let dark = Color(red: 40/255, green: 103/255, blue: 103/255)
        return ["extraLight": extraLight, "light":light, "basic":basic, "dark":dark]
    }
    
    public static var purple: [String: Color] {
        let extraLight = Color(red: 220/255, green: 218/255, blue: 247/255)
        let light = Color(red: 191/255, green: 189/255, blue: 247/255)
        let basic = Color(red: 170/255, green: 166/255, blue: 255/255)
        let dark = Color(red: 153/255, green: 153/255, blue: 255/255)
        return ["extraLight": extraLight, "light":light, "basic":basic, "dark":dark]
    }
    
    public static var orange: [String: Color] {
        let extraLight = Color(red: 237/255, green: 195/255, blue: 170/255)
        let light = Color(red: 237/255, green: 162/255, blue: 120/255)
        let basic = Color(red: 236/255, green: 129/255, blue: 83/255)
        let dark = Color(red: 228/255, green: 107/255, blue: 59/255)
        return ["extraLight": extraLight, "light":light, "basic":basic, "dark":dark]
    }
    
    public static var green: [String: Color] {
        let extraLight = Color(red: 193/255, green: 220/255, blue: 192/255)
        let light = Color(red: 158/255, green: 201/255, blue: 167/255)
        let basic = Color(red: 134/255, green: 181/255, blue: 149/255)
        let dark = Color(red: 104/255, green: 151/255, blue: 123/255)
        return ["extraLight": extraLight, "light":light, "basic":basic, "dark":dark]
    }
    
//    public static var yellow: [String: Color] {
//        let extraLight = Color(red: 255/255, green: 232/255, blue: 159/255)
//        let light = Color(red: 249/255, green: 221/255, blue: 102/255)
//        let basic = Color(red: 243/255, green: 196/255, blue: 47/255)
//        let dark = Color(red: 206/255, green: 166/255, blue: 39/255)
//        return ["extraLight": extraLight, "light":light, "basic":basic, "dark":dark]
//    }
    
    public static var lazur: [String: Color] {
        let extraLight = Color(red: 88/255, green: 206/255, blue: 223/255)
        let light = Color(red: 74/255, green: 186/255, blue: 203/255)
        let basic = Color(red: 29/255, green: 164/255, blue: 181/255)
        let dark = Color(red: 19/255, green: 141/255, blue: 159/255)
        return ["extraLight": extraLight, "light":light, "basic":basic, "dark":dark]
    }
    
    public static var blue: [String: Color] {
        let extraLight = Color(red: 140/255, green: 180/255, blue: 242/255)
        let light = Color(red: 83/255, green: 134/255, blue: 223/255)
        let basic = Color(red: 65/255, green: 106/255, blue: 215/255)
        let dark = Color(red: 50/255, green: 93/255, blue: 198/255)
        return ["extraLight": extraLight, "light":light, "basic":basic, "dark":dark]
    }
    
    public static var coral: [String: Color] {
        let extraLight = Color(red: 255/255, green: 179/255, blue: 179/255)
        let light = Color(red: 255/255, green: 137/255, blue: 133/255)
        let basic = Color(red: 255/255, green: 110/255, blue: 110/255)
        let dark = Color(red: 223/255, green: 83/255, blue: 83/255)
        return ["extraLight": extraLight, "light":light, "basic":basic, "dark":dark]
    }
}
