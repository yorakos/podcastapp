//
//  MyTableViewCell.swift
//  finalp
//
//  Created by Акбота Жумагазина on 20.12.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    var myCollectionView: UICollectionView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 370, height: 230)

        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "collectioncell")
        myCollectionView.dataSource = self
        myCollectionView.delegate = self

        contentView.addSubview(myCollectionView)
        myCollectionView.showsHorizontalScrollIndicator = false

        myCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list[collectionView.tag].imageGallery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! MyCollectionViewCell
        cell.myImage.image = UIImage(named: list[collectionView.tag].imageGallery[indexPath.row])
        return cell
    }
}
