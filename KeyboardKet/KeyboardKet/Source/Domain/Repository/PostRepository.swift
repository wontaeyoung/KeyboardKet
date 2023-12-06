//
//  PostRepository.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/1/23.
//

protocol PostRepository {
  func createPost(post: Post) throws
  func fetchPosts() async throws -> [Post]
  func updatePost(post: Post) throws
  func deletePost(post: Post)
}
