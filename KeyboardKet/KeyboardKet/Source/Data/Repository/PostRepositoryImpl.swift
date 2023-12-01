//
//  PostRepositoryImpl.swift
//  KeyboardKet
//
//  Created by 원태영 on 12/2/23.
//

import FirebaseFirestore

final class PostRepositoryImpl: PostRepository {
  // MARK: - Property
  private let firestoreService: FirestoreService
  
  // MARK: - Initializer
  init(firestoreService: FirestoreService) {
    self.firestoreService = firestoreService
  }
  
  // MARK: - Method
  func createPost(post: Post) throws {
    guard let dto = try post.toDTO() as? PostDTO else {
      throw DTOError.mapToDTOFailed
    }
    
    let documentPath: DocumentReference = firestoreService.getDocumentPath(
      col: .Post,
      docID: dto.id
    )
    
    try firestoreService.addDocument(docPath: documentPath, dto: dto)
  }
  
  func fetchPosts() {
    
  }
  
  func updatePost(post: Post) {
    
  }
  
  func deletePost(postID: String) {
    
  }
}
