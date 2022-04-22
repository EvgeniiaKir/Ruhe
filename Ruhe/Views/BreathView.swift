//
//  BreathView.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 22.04.2022.
//

import SwiftUI

struct BreathView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var buttonText: String = "Go!"
    @State private var animationAmount = 1.0
    @State private var animationColor = Color(red: 102/255, green: 154/255, blue: 154/255)
    @State private var animate = false
    @State private var breatheIn = false
    @State private var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Color(red: 148/255, green: 192/255, blue: 194/255)
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack {
                        HStack {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            }
                            .padding(.leading, 15)
                            .padding(.top, 15)
                            Spacer()
                        }
                        Spacer()
                    }
                    VStack(spacing: 30) {
                        Spacer()
                        Text("Breath with me")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding(.top, -30)
                        Spacer()
                        ZStack {
                            ZStack {
                                Circle().fill(animationColor.opacity(0.25)).frame(width: 190, height: 190).scaleEffect(self.animate ? 1.8 : 0.9)
                                Circle().fill(animationColor.opacity(0.35)).frame(width: 170, height: 170).scaleEffect(self.animate ? 1.4 : 0.9)
                                Circle().fill(animationColor.opacity(0.45)).frame(width: 170, height: 170).scaleEffect(self.animate ? 1.7 : 0.9)
                                Circle().fill(animationColor).frame(width: 170, height: 170).scaleEffect(self.animate ? 1.2 : 0.9)
                            }
                            .animation(.easeInOut(duration: 4.95).repeat(while: animate), value: animate)
                            
                            Button {
                                animationAmount += 1
                                if animationAmount.truncatingRemainder(dividingBy: 2) == 0 {
                                    buttonText = "in"
                                    animate = true
                                    breatheIn = true
                                    startTimer()
                                } else {
                                    buttonText = "Go"
                                    animate = false
                                    breatheIn = false
                                    stopTimer()
                                }
                            } label: {
                                Text(self.buttonText)
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                                    .fontWeight(.bold)
                            }
                            .frame(width: 230, height: 160, alignment: .center)
                            .background(Color(red: 148/255, green: 192/255, blue: 194/255))
                            .clipShape(Circle())
                            .onAppear() {
                                self.stopTimer()
                            }
                            .onReceive(timer){ _ in
                                if breatheIn {
                                    buttonText = "out"
                                    breatheIn = false
                                } else {
                                    buttonText = "in"
                                    breatheIn = true
                                }
                            }
                        }
                        Spacer()
                        Spacer()
                    }
                })
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    }
}

extension Animation {
    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}

struct BreathView_Previews: PreviewProvider {
    static var previews: some View {
        BreathView()
    }
}
