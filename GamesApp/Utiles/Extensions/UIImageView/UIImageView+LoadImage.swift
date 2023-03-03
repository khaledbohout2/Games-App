//
//  UIImageView+LoadImage.swift
//  GamesApp
//
//  Created by Khaled Bohout on 03/03/2023.
//

import SDWebImage

extension UIImageView {
    func load(with url: String) {
        guard let url = URL(string: url) else { return }
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url,
                         placeholderImage: nil,
                         options: .continueInBackground,
                         completed: nil)
    }
}
