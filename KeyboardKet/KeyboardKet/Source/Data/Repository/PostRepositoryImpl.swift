//
//  PostRepositoryImpl.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/2/23.
//

final class PostRepositoryImpl: PostRepository {
  // MARK: - Property
  private let firestoreService: any FirestoreService
  
  // MARK: - Initializer
  init(firestoreService: any FirestoreService) {
    self.firestoreService = firestoreService
  }
  
  // MARK: - Method
  func createPost(post: Post) throws {
    let postDTO: PostDTO = try post.toDTO()
    
    try firestoreService.create(
      col: .Post,
      dto: postDTO
    )
  }
  
  func fetchPosts() async throws -> [Post] {
    let colPath = firestoreService.getCollectionPath(col: .Post)
    
    return []
  }
  
  func updatePost(post: Post) {
    
  }
  
  func deletePost(postID: String) {
    
  }
}
