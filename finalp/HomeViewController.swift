import UIKit
import SnapKit

struct Data {
    let sectionType: String
    let imageGallery: [String]
}

var list = [
    Data(sectionType: "  With celebrities", imageGallery: ["dua", "jen", "bts", "kim", "selena", "odin", "kob", "elon"]),
    Data(sectionType: "  Mindset workout", imageGallery: ["mind", "tony", "tom", "ddd"]),
    Data(sectionType: "  Relationship", imageGallery: ["best", "red", "bb", "love"]),
    Data(sectionType: "  Psychology", imageGallery: ["fir", "podcast_psychology", "max", "adina"]),
    Data(sectionType: "  Margulan Seisembayev", imageGallery: ["algash", "images", "orta", "zhena"])
]

class HomeViewController: UIViewController {

    var myTableView: UITableView!
        let popularListLabel = UILabel()
        let searchButton = UIButton()
        let searchBar = UISearchBar()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupPopularListLabel()
            setupSearchButton()
            setupTableView()
            setupSearchBar()
        }


    func setupPopularListLabel() {
        popularListLabel.text = "Popular List"
        popularListLabel.textColor = .black
        popularListLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        view.addSubview(popularListLabel)

        popularListLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(33)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(25)
        }
    }

    func setupSearchButton() {
        searchButton.imageView?.contentMode = .scaleAspectFit
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        view.addSubview(searchButton)

        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(popularListLabel)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-25)
            make.width.height.equalTo(35)
        }
    }

    func setupSearchBar() {
        searchBar.isHidden = true
        searchBar.delegate = self
        view.addSubview(searchBar)

        searchBar.snp.makeConstraints { make in
            make.top.equalTo(popularListLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    func setupTableView() {
        myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(myTableView)

        myTableView.snp.makeConstraints { make in
            make.top.equalTo(popularListLabel.snp.bottom).offset(-3)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    @objc func searchButtonTapped() {
           searchBar.isHidden = false
           searchBar.becomeFirstResponder()
       }
   }

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.isHidden = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.myCollectionView.tag = indexPath.section
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .black

        let titleLabel = UILabel()
        titleLabel.text = list[section].sectionType
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

        headerView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerView).offset(15)
            make.centerY.equalTo(headerView)
        }

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50 
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .systemBlue
    }
}
