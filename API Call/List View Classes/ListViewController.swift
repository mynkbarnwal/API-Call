//
//  ViewController.swift
//  API Call
//
//  Created by Mayank Barnwal on 04/05/24.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var containerCollectionView: UICollectionView!
    
    var listViewModal:ListViewModal!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModal()
        
        listViewModal.getUserList()
        
        containerCollectionView.register(UINib.init(nibName: ListCollectionViewCell.getCellIdentifier(), bundle: nil),
                                         forCellWithReuseIdentifier: ListCollectionViewCell.getCellIdentifier())
    }

}

extension ListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listViewModal.userList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.getCellIdentifier(), for: indexPath) as? ListCollectionViewCell{
            cell.user = listViewModal.userList[indexPath.row]
            return cell
        }
        fatalError("Cell identifier not found")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width - 20, height: 60)
    }
    
    
}

extension ListViewController{
    func configureViewModal() {
        listViewModal = ListViewModal(eventHandler: {[weak self] event in
            guard let self = self else {
                return
            }
            switch event {
            case .loading:
                showWaitingView()
            case .stopLoading:
                hideWaitingView()
            case .listFetched:
                containerCollectionView.reloadData()
            case .errorInFetchingList:
                makeAlert(listViewModal.errorMessage)
            }
        })
    }
}

