//
//  MyCollectionViewCell.swift
//  finalp
//
//  Created by Акбота Жумагазина on 20.12.2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImage)

        myImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
