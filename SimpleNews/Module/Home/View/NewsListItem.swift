//
//  NewsListItem.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsListItem: View {
  
  var news: NewsModel
  
  var body: some View {
    HStack {
      image
      VStack(alignment: .leading) {
        title
        desc
      }
      spacer
    }
    .padding(.vertical, 10)
    .padding(.horizontal)
  }
  
}

extension NewsListItem {
  
  var image: some View {
    Group {
      if news.imageUrl == "unknown" {
        Image(systemName: "photo")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundColor(Color("BW"))
          .frame(width: 75, height: 75)
          
      } else {
        WebImage(url: URL(string: news.imageUrl)!)
          .renderingMode(.original)
          .resizable()
          .indicator(.activity)
          .transition(.fade)
          .aspectRatio(contentMode: .fill)
          .frame(width: 75, height: 75)
          .cornerRadius(5)
      }
    }
  }
  
  var title: some View {
    Text(news.title)
      .foregroundColor(Color("BW"))
      .font(.system(size: 16))
      .fontWeight(.medium)
      .lineLimit(2)
  }
  
  var desc: some View {
    Text(news.description)
      .foregroundColor(Color(.systemGray))
      .font(.system(size: 11))
      .fontWeight(.regular)
      .lineLimit(2)
  }
  
  var spacer: some View {
    Spacer()
  }
  
}

struct NewsListItem_Previews: PreviewProvider {
  static var previews: some View {
    NewsListItem(news: NewsModel(id: "", source: "ASDASDSA", author: "adadin", title: "pesawat terbang kemanamnaa wooOWWOOWOWOWOWOOaaaaaaaaaaaW", description: "WHHHHHWE Tenandayo ASDADSA DAS D AS DSADASD ASD SDASDASDSADASDSADASDSADSADSASDSDADS", url: "https://1cak.com", imageUrl: "https://pngimg.com/uploads/teacher/teacher_PNG24.png", published: "123", content: "ASDADSADASDA"))
  }
}
