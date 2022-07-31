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
    @Binding var basicColor: Color?
    @Binding var darkColor: Color?

    var body: some View {
        HStack {
            if isUser {
                Spacer()
            }
            Text(contentMessage)
                .padding(10)
                .font(.system(size: 17).weight(.bold))
                .foregroundColor(Color.white)
                .background(isUser ? basicColor : darkColor)
                .cornerRadius(10)
            if !isUser {
                Spacer()
            }
        }
    }
}
