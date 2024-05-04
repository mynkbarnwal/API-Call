//
//  ListViewModal.swift
//  API Call
//
//  Created by Mayank Barnwal on 04/05/24.
//

import Foundation


class ListViewModal:NSObject{
    
    private override init() {}
    
    init(eventHandler: (@escaping (_: Event) -> Void)){
        self.eventHandler = eventHandler
    }
    
    private var eventHandler: ((_ event: Event) -> Void)?
    
    var errorMessage:String!
    
    var userList:[GitUserModalElement] = []
    
    func getUserList() {
        eventHandler?(.loading)
        GetAPI().getUserDetails {[self] response in
            eventHandler?(.stopLoading)
            switch response {
            case .success(let success):
                userList = success
                eventHandler?(.listFetched)
            case .failure(let failure):
                errorMessage = failure.errorDescription
                eventHandler?(.errorInFetchingList)
            }
        }
    }
    
}

extension ListViewModal{
    enum Event {
        case loading
        case stopLoading
        case listFetched
        case errorInFetchingList
    }
}
