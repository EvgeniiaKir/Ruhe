//
//  BubblesView.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 22.04.2022.
//

import SwiftUI
import AVFoundation

struct BubblesView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var audioPlayer: AVAudioPlayer!
    @State private var isFun = false
    @State private var audioAsset = "popped"
    @State private var bubblesArray: [[String]] = Array(repeating: Array(repeating: "fullBubble", count: 6), count: 8)
    private let screamsArray: [String] = ["screamOne", "screamTwo", "screamThree"]
    
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
                    VStack(spacing: 20) {
                        Text("Let's pop them")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding(.top, -30)
                        Text("(Fun mode)")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.top, -10)
                        Toggle ("", isOn: $isFun)
                            .toggleStyle(SwitchToggleStyle(tint: Color(red: 102/255, green: 154/255, blue: 154/255)))
                            .frame(width: 50, height: 30, alignment: .center)
                            .padding(.top, -20)
                        VStack {
                            ForEach(0..<bubblesArray.endIndex, id:\.self) { rowIndex in
                                HStack {
                                    ForEach(0..<bubblesArray[rowIndex].endIndex, id:\.self) { columnImdex in
                                        let imageName = bubblesArray[rowIndex][columnImdex]
                                        Image(imageName)
                                            .resizable()
                                            .frame(width: 45, height: 45, alignment: .center)
                                            .onTapGesture {
                                                if imageName != "poppedBubble"{
                                                    audioAsset = isFun ? screamsArray.randomElement()! : "popped"
                                                    playAudioAsset(audioAsset)
                                                    bubblesArray[rowIndex].remove(at: columnImdex)
                                                    bubblesArray[rowIndex].insert("poppedBubble", at: columnImdex)
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        .frame(width: 330, height: 430)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 5)
                        )
                    }
                })
    }
    
    func playAudioAsset(_ assetName : String) {
        guard let audioData = NSDataAsset(name: assetName)?.data else {
            fatalError("Unable to find asset \(assetName)")
        }
        
        do {
            self.audioPlayer = try AVAudioPlayer(data: audioData)
            self.audioPlayer.play()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

struct BubblesView_Previews: PreviewProvider {
    static var previews: some View {
        BubblesView()
    }
}
