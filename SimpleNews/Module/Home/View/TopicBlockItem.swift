//
//  TopicBlockItem.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import SwiftUI

struct TopicBlockItem: View {
  
  var topic: String
  
  var body: some View {
    ZStack {
      background
      gradient
      title
    }
    .frame(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.width / 2 - 20)
    .cornerRadius(10)
  }
  
}

extension TopicBlockItem {
  
  var background: some View {
    //    Image(systemName: "photo")
    //      .resizable()
    Color.yellow
  }
  
  var title: some View {
    VStack {
      HStack {
        Text(topic)
          .foregroundColor(.white)
          .font(.system(size: 35))
          .fontWeight(.bold)
          .padding()
        spacer
      }
      spacer
    }
  }
  
  var gradient: some View {
    LinearGradient(gradient: Gradient(colors: [Color(.clear), Color(.black).opacity(0.7)]), startPoint: .top, endPoint: .bottom)
  }
  
  var spacer: some View {
    Spacer()
  }
  
}
