//
//  ContentMessageView.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 22.04.2022.
//

import SwiftUI

struct ContentMessageView: View {
    var contentMessage: String
    var isUser: Bool
    
    var body: some View {
        HStack {
            if !isUser {
                Spacer()
            }
            Text(contentMessage)
                .padding(10)
                .font(.system(size: 17).weight(.bold))
                .foregroundColor(Color.white)
                .background(isUser ? Color(red: 102/255, green: 154/255, blue: 154/255) : Color(red: 40/255, green: 103/255, blue: 103/255))
                .cornerRadius(10)
            if isUser {
                Spacer()
            }
        }
    }
}
