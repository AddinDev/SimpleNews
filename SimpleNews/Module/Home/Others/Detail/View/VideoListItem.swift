//
//  VideoListItem.swift
//  SimpleNews
//
//  Created by addin on 09/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoListItem: View {
  
  var video: VideoModel

  var body: some View {
    content
  }
  
}

extension VideoListItem {
  
  var content: some View {
    HStack {
      image
      VStack(alignment: .leading) {
        title
        description
      }
      spacer
    }
    .padding(10)
  }
  
  var image: some View {
    WebImage(url: URL(string: video.thumbnail))
      .renderingMode(.original)
      .resizable()
      .indicator(.activity)
      .transition(.fade)
      .aspectRatio(contentMode: .fit)
      .frame(height: 70)
  }
  
  var title: some View {
    Text(video.title)
      .fontWeight(.medium)
      .foregroundColor(Color("BW"))
      .lineLimit(3)
      .font(.system(size: 15))
  }
  
  var description: some View {
    Text(video.description)
      .font(.system(size: 13))
      .foregroundColor(Color(.systemGray))
      .lineLimit(2)
  }
  
  var spacer: some View {
    Spacer()
  }
  
}
