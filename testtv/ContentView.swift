//
//  ContentView.swift
//  testtv
//
//  Created by Ярослав on 23.12.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Volume", destination: VolumeView(viewModel: viewModel))
                NavigationLink("Keys", destination: KeyView(viewModel: viewModel))
                NavigationLink("Mouse", destination: MouseView(viewModel: viewModel))
            }
            .listStyle(.sidebar)
            
            VStack {
                Text("Connected: \(viewModel.clientKey ?? "")")
            }
            .alert("Please accept prompt on the TV.", isPresented: $viewModel.showPromptAlert) {}
        }
    }
}

#Preview {
    ContentView()
}
