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
        let light = Color(red: 148/255, green: 192/255, blue: 194/255)
        let basic = Color(red: 102/255, green: 154/255, blue: 154/255)
        let dark = Color(red: 40/255, green: 103/255, blue: 103/255)
        return ["basic":basic, "dark":dark, "light":light]
    }
    
    public static var purple: [String: Color] {
        let light = Color(red: 204/255, green: 204/255, blue: 255/255)
        let basic = Color(red: 177/255, green: 177/255, blue: 249/255)
        let dark = Color(red: 153/255, green: 153/255, blue: 255/255)
        return ["basic":basic, "dark":dark, "light":light]
    }
    
    public static var orange: [String: Color] {
        let light = Color(red: 237/255, green: 162/255, blue: 120/255)
        let basic = Color(red: 236/255, green: 129/255, blue: 83/255)
        let dark = Color(red: 228/255, green: 107/255, blue: 59/255)
        return ["basic":basic, "dark":dark, "light":light]
    }
    
    public static var green: [String: Color] {
        let light = Color(red: 193/255, green: 220/255, blue: 192/255)
        let basic = Color(red: 170/255, green: 198/255, blue: 169/255)
        let dark = Color(red: 134/255, green: 181/255, blue: 153/255)
        return ["basic":basic, "dark":dark, "light":light]
    }
}
