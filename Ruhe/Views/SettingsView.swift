//
//  SettingsView.swift
//  Ruhe
//
//  Created by Evgeniia Kiriushina on 19.06.2022.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var colorsArray = [Color.coral, Color.orange, Color.green, Color.lazur, Color.blue, Color.purple]
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
                        Text("Choose your calming color")
                            .foregroundColor(.white)
                            .font(.system(size: 37))
                            .fontWeight(.bold)
                            .padding(.top, -70)
                        HStack {
                            ForEach(0..<colorsArray.endIndex, id:\.self) { item in
                                    Button {
                                        colorData.saveColors(extraLightColor: colorsArray[item]["extraLight"]!, lightColor: colorsArray[item]["light"]!, basicColor: colorsArray[item]["basic"]!, darkColor: colorsArray[item]["dark"]!)
                                        let colors = colorData.loadColors()
                                        extraLightColor = colors["extraLight"]
                                        lightColor = colors["light"]
                                        basicColor = colors["basic"]
                                        darkColor = colors["dark"]
                                    } label: {
                                        Image(systemName: "circle")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                    .background(colorsArray[item]["light"])
                                    .cornerRadius(50)
                                    .clipped()
                            }
                        }
                    }
                }
    )}
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(backColor: $backColor)
//    }
//}
