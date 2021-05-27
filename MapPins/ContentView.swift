//
//  ContentView.swift
//  MapPins
//
//  Created by Shota Shimazu on 2021/05/27.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @State private var text: String = ""
    @State private var isDisplay: Bool = false

    @State private var pins: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 35.388465, longitude: 139.425502)

    var body: some View {
        ZStack {
            TextFieldAlertView(
                text: $text,
                isShowingAlert: $isDisplay,
                placeholder: "",
                isSecureTextEntry: false,
                title: "座標を入力",
                message: "Map座標を入力してください",
                leftButtonTitle: "キャンセル",
                rightButtonTitle: "追加",
                leftButtonAction: nil,
                rightButtonAction: {
                    
                    let latitude: Double = Double(text.components(separatedBy: ", ")[0]) ?? 0.0
                    
                    let longitude: Double = Double(text.components(separatedBy: ", ")[1]) ?? 0.0

                    let newCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    
                    pins = newCoordinate
                }
            )
            VStack {
                MapView(location: $pins)
                Button("座標を入力") {
                    isDisplay = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
