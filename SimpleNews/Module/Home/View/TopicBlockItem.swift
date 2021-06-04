//
//  TopicBlockItem.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopicBlockItem: View {
  
  var topic: String
  var imageUrl: String
  
  var body: some View {
    ZStack {
      background
      image
      gradient
      title
    }
    .frame(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.width / 2 - 20)
    .cornerRadius(10)
  }
  
}

extension TopicBlockItem {
  
  var image: some View {
    //    Image(systemName: "photo")
    WebImage(url: URL(string: imageUrl)!)
      .renderingMode(.original)
      .resizable()
      .indicator(.activity)
      .transition(.fade)
      .scaledToFit()
//    Color.yellow
  }
  
  var background: some View {
        Color.yellow
  }
  
  var title: some View {
    VStack {
      HStack {
        Text(topic)
          .foregroundColor(.white)
          .font(.system(size: 32))
          .fontWeight(.bold)
          .padding([.leading, .top])
        spacer
      }
      spacer
    }
  }
  
  var gradient: some View {
    LinearGradient(gradient: Gradient(colors: [Color(.clear), Color("WB").opacity(0.7)]), startPoint: .top, endPoint: .bottom)
  }
  
  var spacer: some View {
    Spacer()
  }
  
}
