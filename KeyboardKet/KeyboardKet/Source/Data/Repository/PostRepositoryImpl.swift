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
    guard let dto = try post.toDTO() as? PostDTO else {
      throw DTOError.mapToDTOFailed
    }
    
    let documentPath = firestoreService.getDocumentPath(
      col: .Post,
      docID: dto.id
    )
    
    try firestoreService.addDocument(docPath: documentPath, dto: dto)
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
