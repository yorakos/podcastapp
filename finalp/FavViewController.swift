import UIKit
import SnapKit

class FavViewController: UIViewController {

    private lazy var favoritesLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorites"
        label.font  = UIFont.systemFont(ofSize: 40, weight: .bold) 
        return label
    }()

    private lazy var heartIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart.circle.fill"))
        imageView.tintColor = .systemBlue
        return imageView
    }()

    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Your favourites are empty"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    private lazy var goToMainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to main page", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(goToMainPage), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        view.addSubview(favoritesLabel)
        view.addSubview(heartIconImageView)
        view.addSubview(emptyLabel)
        view.addSubview(goToMainButton)

        favoritesLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(33)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(25)
        }
        heartIconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
            make.width.equalTo(66)
            make.height.equalTo(66)
        }
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(heartIconImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        goToMainButton.snp.makeConstraints { make in
            make.top.equalTo(emptyLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }

    @objc private func goToMainPage() {
        tabBarController?.selectedIndex = 1
    }
}
