//
//----------------------------------------------
// Original project: Date_ColorPickers
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions (Stewart Lynch). All rights reserved.


import SwiftUI

struct ColorPickers: View {
    @State private var color1 = Color.red
    @State private var color2 = Color.green
    @State private var color3 = CGColor(red: 1.0, green: 1.0, blue: 0, alpha: 1)
    @State private var color4 = UIColor.systemGray6
    @State private var showUIPicker = false
    var body: some View {
        VStack{
            ViewOption.fourth.descrView
            ScrollView {
                DisplayContainer("Basic with Color") {
                    ColorPicker("Select Color", selection: $color1)
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color1)
                        .frame(height: 50)
                }
                DisplayContainer("Color - No Opacity") {
                    ColorPicker("Select Color",
                                selection: $color2,
                                supportsOpacity: false
                    )
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color2)
                        .frame(height: 50)
                }
                DisplayContainer("CGColor") {
                    ColorPicker("Select Color", selection: $color3)
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(cgColor: color3))
                        .frame(height: 50)
                    if let comps = color3.components {
                        Text("Red \(comps[0])")
                        let compString = comps.map {
                            String(format: "%.1f", $0)
                        }.joined(separator: ", ")
                        Text("[\(Text(compString))]")
                    }
                }
                DisplayContainer("UIKit ColorPicker") {
                    Button {
                        showUIPicker = true
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(color4))
                            .frame(height: 50)
                    }
                    .sheet(isPresented: $showUIPicker) {
                        UIColorPickerSheet(color: $color4)
                    }
                }
                
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        ColorPickers()
            .navigationTitle(ViewOption.fourth.title)
            .toolbarTitleDisplayMode(.inlineLarge)
    }
}

struct UIColorPickerSheet: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    @Binding var color: UIColor
    var supportsAlpha: Bool = true
    func makeUIViewController(context: Context) -> UIColorPickerViewController {
        let vc = UIColorPickerViewController()
        vc.selectedColor = color
        vc.supportsAlpha = supportsAlpha
        vc.supportsEyedropper = false
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIColorPickerViewController, context: Context) {
        uiViewController.selectedColor = color
    }
    
    final class Coordinator: NSObject, UIColorPickerViewControllerDelegate {
        var parent: UIColorPickerSheet
        init(parent: UIColorPickerSheet) {
            self.parent = parent
        }
        
        func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
            parent.color = viewController.selectedColor
        }
    }
}
