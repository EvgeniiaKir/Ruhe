//
//  ChatView.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 22.04.2022.
//

import SwiftUI
import Combine

struct ChatView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var keyboardHeight: CGFloat = 0
    @State private var inputText: String = ""
    @State private var userMsg: String = ""
    @State private var messages = [
        Message(content: "Hi, would you like to share something with me?", isUser: false)
    ]
    private let botMessages = [
        "I understand you. Why do you think you feel like this?",
        "Why?",
        "Why do you think so?",
        "Let's dig deeper, why do you think like that?",
        "I feel you. Why does it bother you so much?"
    ]
    @Binding var lightColor: Color?
    @Binding var basicColor: Color?
    @Binding var darkColor: Color?

    var body: some View {
        lightColor
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
                    VStack(spacing: 15) {
                        Text("Wanna talk?")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding()
                        ScrollView {
                            ScrollViewReader{ value in
                                VStack(spacing: 20) {
                                    ForEach(messages, id: \.self) { msg in
                                        ContentMessageView(contentMessage: msg.content, isUser: msg.isUser, basicColor: $basicColor, darkColor: $darkColor)
                                    }
                                    Spacer()
                                        .id("anID")
                                }
                                .padding()
                                .onChange(of: self.messages.count, perform: { count in
                                    withAnimation {
                                        value.scrollTo("anID")
                                    }
                                })
                            }
                        }
                        .frame(width: 330, height: 510)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 5)
                        )
                        HStack(spacing: 5) {
                            if #available(iOS 15.0, *) {
                                TextField("Type here...", text: $inputText)
                                    .frame(width: 290)
                                    .disableAutocorrection(false)
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundColor(basicColor)
                                    .padding(.bottom, keyboardHeight)
                                    .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
                                    .onSubmit {
                                        if !inputText.isEmpty {
                                            userMsg = inputText
                                            inputText = ""
                                            sendMessage()
                                        }
                                    }
                                    .submitLabel(.done)
                            } else {
                                TextField("Type here...", text: $inputText)
                                    .frame(width: 250)
                                    .disableAutocorrection(false)
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundColor(basicColor)
                                    .padding(.bottom, keyboardHeight)
                                    .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
                                Button {
                                    if !inputText.isEmpty {
                                        userMsg = inputText
                                        inputText = ""
                                        sendMessage()
                                    }
                                } label: {
                                    Image(systemName: "arrow.up.circle")
                                        .font(.system(size: 35).weight(.bold))
                                        .foregroundColor(.white)
                                }
                                .padding(.leading, 5)
                            }
                        }
                    }
                })
    }
    
    func sendMessage() {
        self.messages.append(Message(content: userMsg, isUser: true))
        userMsg = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.5...1.5)) {
            self.messages.append(Message(content: botMessages.randomElement() ?? "Why?", isUser: false))
        }
    }
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
