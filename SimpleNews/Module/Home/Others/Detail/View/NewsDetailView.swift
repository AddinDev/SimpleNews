//
//  NewsDetailView.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
  
  @ObservedObject var presenter: NewsDetailPresenter
  
  var body: some View {
    content
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarItems(trailing: source)
  }
  
}

extension NewsDetailView {
  
  var content: some View {
    ScrollView {
      VStack(alignment: .leading) {
        image
        Group {
        title
        author
        published
        desc
        }
        .padding(.horizontal)
      }
    }
  }
  
  var image: some View {
    Group {
      if presenter.news.imageUrl == "unknown" {
        Image(systemName: "photo")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 200)
        
      } else {
        WebImage(url: URL(string: presenter.news.imageUrl)!)
          .resizable()
          .indicator(.activity)
          .transition(.fade)
          .aspectRatio(contentMode: .fill)
          .frame(height: 200)
          .cornerRadius(5)
      }
    }
    .padding(.vertical, 0)
  }
  
  var title: some View {
    Text(presenter.news.title)
      .font(.system(size: 25))
      .fontWeight(.bold)
      .padding(.horizontal, 10)
  }
  
  var desc: some View {
    presenter.linkToDetail {
      Text(presenter.news.content)
        .foregroundColor(Color("BW"))
        .underline(true, color: .blue)
    }
    .padding(10)
  }
  
  var author: some View {
    HStack {
      Text("Author: ")
        .foregroundColor(Color(.systemGray))
      Text(presenter.news.author)
      spacer
    }
    .font(.footnote)
    .padding(.top)
    .padding(.horizontal)
  }
  
  var published: some View {
    HStack {
      Text("Published: ")
        .foregroundColor(Color(.systemGray))
        .font(.footnote)
      Text(presenter.news.published)
        .font(.footnote)
      spacer
    }
    .padding(.vertical, 0)
    .padding(.bottom)
    .padding(.horizontal)
  }
  
  var source: some View {
    Text(presenter.news.source)
  }
  
  var spacer: some View {
    Spacer()
  }
  
}
