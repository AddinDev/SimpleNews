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
      .onAppear {
        //        if 
        presenter.getVideos()
      }
      .navigationBarTitle("🗿", displayMode: .inline)
      .navigationBarItems(trailing: source)
  }
  
}

extension NewsDetailView {
  
  var content: some View {
    ScrollView {
      LazyVStack(alignment: .leading) {
        image
        Group {
          title
          author
          published
          desc
        }
        .padding(.horizontal, 7)
        videos
      }
    }
  }
  
  var image: some View {
    Group {
      if presenter.news.imageUrl == "unknown" {
        HStack {
          spacer
          Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
          spacer
        }
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
      Text(presenter.news.description)
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
    .padding(.horizontal)
    .padding(.top, 10)
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
    .padding(.horizontal)
  }
  
  var source: some View {
    Text(presenter.news.source)
  }
  
  var videos: some View {
    Group {
      if presenter.isLoading {
        HStack {
        spacer
        loadingIndicator
        spacer
        }
        .padding(.top)
      } else if presenter.isError {
        HStack {
        spacer
        errorIndicator
        spacer
        }
        .padding(.top)
      } else {
        ForEach(presenter.videos) { video in
          VideoListItem(video: video)
        }
      }
    }
  }
  
  var spacer: some View {
    Spacer()
  }
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle())
    }
  }
  
  var errorIndicator: some View {
    VStack {
      Text("Error")
        .bold()
        .foregroundColor(.red)
      Text(presenter.errorMessage)
    }
  }
  
}
