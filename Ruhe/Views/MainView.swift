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
    @State private var openSettings: Bool = false
    @Binding var extraLightColor: Color?
    @Binding var lightColor: Color?
    @Binding var basicColor: Color?
    @Binding var darkColor: Color?
    var colorData = ColorData()

    var body: some View {
        lightColor
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                self.openSettings = true
                            } label: {
                                Image(systemName: "gearshape")
                                    .font(.system(size: 35))
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 15)
                            .padding(.top, 15)
                            .fullScreenCover(isPresented: $openSettings, content: {
                                SettingsView(extraLightColor: $extraLightColor, lightColor: $lightColor, basicColor: $basicColor, darkColor: $darkColor)
                            })
                        }
                        Spacer()
                    }
                        
                    VStack(spacing: 30) {
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
                                ChatView(extraLightColor: $extraLightColor, lightColor: $lightColor, basicColor: $basicColor, darkColor: $darkColor)
                            })
                            Button {
                                self.openBreath = true
                            } label: {
                                Image(systemName: "lungs")
                                    .font(.system(size: 65))
                            }
                            .buttonStyle(MainButton())
                            .fullScreenCover(isPresented: $openBreath, content: {
                                BreathView(extraLightColor: $extraLightColor, lightColor: $lightColor, basicColor: $basicColor, darkColor: $darkColor)
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
                            BubblesView(extraLightColor: $extraLightColor, lightColor: $lightColor, basicColor: $basicColor, darkColor: $darkColor)
                        })
                    }
                }
                    .onAppear{
                        let colors = colorData.loadColors()
                        extraLightColor = colors["extraLight"]
                        lightColor = colors["light"]
                        basicColor = colors["basic"]
                        darkColor = colors["dark"]
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


//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(backColor: $backColor)
//    }
//}
