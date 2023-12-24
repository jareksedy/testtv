//
//  KeyView.swift
//  testtv
//
//  Created by Ярослав on 24.12.2023.
//

import SwiftUI

fileprivate enum Constants {
    static let size: CGFloat = 50
}

struct KeyView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button(action: {
                        viewModel.tv?.sendKey(.volumeUp)
                    }) {
                        Image(systemName: "speaker.plus")
                            .frame(width: Constants.size, height: Constants.size)
                    }
                    Button(action: {
                        viewModel.tv?.sendKey(.volumeDown)
                    }) {
                        Image(systemName: "speaker.minus")
                            .frame(width: Constants.size, height: Constants.size)
                    }
                }
                
                HStack {
                    VStack {
                        Button(action: {
                            viewModel.tv?.sendKey(.left)
                        }) {
                            Image(systemName: "arrowtriangle.left")
                                .frame(width: Constants.size, height: Constants.size)
                        }
                    }
                    
                    VStack {
                        Button(action: {
                            viewModel.tv?.sendKey(.up)
                        }) {
                            Image(systemName: "arrowtriangle.up")
                                .frame(width: Constants.size, height: Constants.size)
                        }
                        
                        Button(action: {
                            viewModel.tv?.sendKey(.enter)
                        }) {
                            Image(systemName: "circle")
                                .frame(width: Constants.size, height: Constants.size)
                        }
                        
                        Button(action: {
                            viewModel.tv?.sendKey(.down)
                        }) {
                            Image(systemName: "arrowtriangle.down")
                                .frame(width: Constants.size, height: Constants.size)
                        }
                    }
                    
                    VStack {
                        Button(action: {
                            viewModel.tv?.sendKey(.right)
                        }) {
                            Image(systemName: "arrowtriangle.right")
                                .frame(width: Constants.size, height: Constants.size)
                        }
                    }
                }
                .padding()
                
                VStack {
                    Button(action: {
                        viewModel.tv?.sendKey(.channelUp)
                    }) {
                        Image(systemName: "plus.rectangle")
                            .frame(width: Constants.size, height: Constants.size)
                    }
                    Button(action: {
                        viewModel.tv?.sendKey(.channelDown)
                    }) {
                        Image(systemName: "minus.rectangle")
                            .frame(width: Constants.size, height: Constants.size)
                    }
                }
            }
            
            Spacer()
                .frame(height: 25)
            
            HStack {
                Button(action: {
                    viewModel.tv?.sendKey(.back)
                }) {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .frame(width: Constants.size, height: Constants.size)
                }
                Button(action: {
                    viewModel.tv?.sendKey(.home)
                }) {
                    Image(systemName: "house")
                        .frame(width: Constants.size, height: Constants.size)
                }
                Button(action: {
                    viewModel.tv?.sendKey(.menu)
                }) {
                    Image(systemName: "gearshape")
                        .frame(width: Constants.size, height: Constants.size)
                }
            }
            
            Spacer()
                .frame(height: 25)
            
            HStack {
                Button("      ", action: { viewModel.tv?.sendKey(.red) })
                    .background(.red)
                    
                Button("      ", action: { viewModel.tv?.sendKey(.green) })
                    .background(.green)
                    
                Button("      ", action: { viewModel.tv?.sendKey(.yellow) })
                    .background(.yellow)
                    
                Button("      ", action: { viewModel.tv?.sendKey(.blue) })
                    .background(.blue)
            }
            
            Spacer()
                .frame(height: 25)
            
            HStack {
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
        .padding()
    }
}
