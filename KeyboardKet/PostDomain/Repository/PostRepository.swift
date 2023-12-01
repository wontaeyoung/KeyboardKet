//
//  PostRepository.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/1/23.
//

protocol PostRepository {
  func createPost(post: Post)
  func fetchPosts()
  func updatePost(post: Post)
  func deletePost(postID: String)
}
