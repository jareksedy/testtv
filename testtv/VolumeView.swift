//
//  VolumeView.swift
//  testtv
//
//  Created by Ярослав on 24.12.2023.
//

import SwiftUI

struct VolumeView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack {
            Text("Volume: \(String(Int(viewModel.volumeLevel)))")
                .font(.title)
            Slider(value: $viewModel.volumeLevel, in: 0...100, onEditingChanged: { editing in
                if !editing {
                    viewModel.setVolume(Int(viewModel.volumeLevel))
                }
            })
        }
        .padding()
    }
}

//#Preview {
//    VolumeView()
//}
