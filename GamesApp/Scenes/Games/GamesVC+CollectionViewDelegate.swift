//
//  GamesVC+CollectionViewDelegate.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

extension GamesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getGamesCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GameCell = collectionView.forceDequeueCell(identifier: GameCell.identifier, for: indexPath)
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsPerRow: CGFloat = traitCollection.horizontalSizeClass == .regular ? 2 : 1
        let width = collectionView.frame.width / noOfCellsPerRow
        return CGSize(width: width, height: (width * 0.36))
    }

}
