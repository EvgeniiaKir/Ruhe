//
//  RuheApp.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 22.04.2022.
//

import SwiftUI

struct MainView: View {
    @State private var openChat: Bool = false
    @State private var openBreath: Bool = false
    @State private var openBubbles: Bool = false
    
    var body: some View {
        Color(red: 148/255, green: 192/255, blue: 194/255)
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Text("Let's have a break")
                        .foregroundColor(.white)
                        .font(.system(size: 37))
                        .fontWeight(.bold)
                        .padding(.top, -60)
                    HStack {
                        Button {
                            self.openChat = true
                        } label: {
                            Image(systemName: "bubble.left.and.bubble.right")
                                .font(.system(size: 60))
                        }
                        .buttonStyle(MainButton())
                        .fullScreenCover(isPresented: $openChat, content: {
                            ChatView()
                        })
                        Button {
                            self.openBreath = true
                        } label: {
                            Image(systemName: "lungs")
                                .font(.system(size: 65))
                        }
                        .buttonStyle(MainButton())
                        .fullScreenCover(isPresented: $openBreath, content: {
                            BreathView()
                        })
                    }
                    .padding(.top, 90)
                    Button {
                        self.openBubbles = true
                    } label: {
                        Image(systemName: "circle.hexagonpath")
                            .font(.system(size: 70))
                    }
                    .buttonStyle(MainButton())
                    .fullScreenCover(isPresented: $openBubbles, content: {
                        BubblesView()
                    })
                })
    }
}

struct MainButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 170, height: 150, alignment: .center)
            .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
