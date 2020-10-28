//
//  PostList.swift
//  Water Testing
//
//  Created by Christian David Turner on 10/28/20.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    
    var body: some View {
        List(posts){ post in
            Text(post.title)
        }.onAppear(){
            API().getTests { (posts) in
                self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
