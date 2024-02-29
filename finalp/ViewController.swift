import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    private lazy var photoView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        let imageView = UIImageView(image: UIImage(named: "first.png"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return view
    }()
    
    private lazy var nameLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        let nameLabel = UILabel()
        nameLabel.text = "Akbota Zhumagazina"
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.boldSystemFont(ofSize: 23)
        
        let userLabel = UILabel()
        userLabel.text = "user10961038"
        userLabel.textAlignment = .left
        userLabel.font = UIFont.systemFont(ofSize: 14)
        
        let joinedLabel = UILabel()
        joinedLabel.text = "Joined November 2023"
        joinedLabel.textAlignment = .left
        joinedLabel.font = UIFont.systemFont(ofSize: 14)
        
        let followingLabel = UILabel()
        followingLabel.text = "0 Following"
        followingLabel.textAlignment = .center
        followingLabel.font = UIFont.boldSystemFont(ofSize: 16)
        followingLabel.textColor = .systemBlue
        
        let followersLabel = UILabel()
        followersLabel.text = "0 Followers"
        followersLabel.textAlignment = .center
        followersLabel.font = UIFont.boldSystemFont(ofSize: 16)
        followersLabel.textColor = .systemBlue
        
        let editProfileLabel = UILabel()
        editProfileLabel.text = "Edit Profile"
        editProfileLabel.textAlignment = .center
        editProfileLabel.font = UIFont.boldSystemFont(ofSize: 16)
        editProfileLabel.textColor = .systemBlue
        
        let distributionView = UIStackView(arrangedSubviews: [followingLabel, followersLabel, editProfileLabel])
        distributionView.axis = .horizontal
        distributionView.distribution = .fillEqually
        distributionView.alignment = .center
        
        let inviteFriendsButton: UIButton = {
                let button = UIButton(type: .system)
                button.setTitle("INVITE FRIENDS", for: .normal)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                button.setTitleColor(.systemBlue, for: .normal)
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor.systemBlue.cgColor
                button.layer.cornerRadius = 18
                button.addTarget(self, action: #selector(handleInviteAction), for: .touchUpInside)

                let customView = UIView()
                customView.frame = CGRect(x: 50, y: 8, width: 40, height: 40)

                let plusIconImageView = UIImageView(image: UIImage(named: "plus"))
                plusIconImageView.contentMode = .scaleAspectFit
                plusIconImageView.clipsToBounds = true

                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(plusImageTapped))
                plusIconImageView.isUserInteractionEnabled = true
                plusIconImageView.addGestureRecognizer(tapGesture)

                customView.addSubview(plusIconImageView)
                button.addSubview(customView)

                return button
            }()
        
        
        let shareButton: UIButton = {
            let button = UIButton(type: .system)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.systemBlue, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.systemBlue.cgColor
            button.layer.cornerRadius = 18
            button.addTarget(self, action: #selector(shareAction), for: .touchUpInside)

            let customView = UIView()
            customView.frame = CGRect(x: 13, y: 6, width: 24, height: 24)

            let photoIconImageView: UIImageView = {
                let imageView = UIImageView(image: UIImage(named: "send"))
                imageView.contentMode = .scaleAspectFit
                imageView.clipsToBounds = true

                let size: CGFloat = 20.0
                imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(shareAction))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGesture)

                return imageView
            }()

            customView.addSubview(photoIconImageView)
            button.addSubview(customView)

            return button
        }()
        let uploadPodcastButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.red, for: .normal)
            button.addTarget(self, action: #selector(uploadPodcastButtonTapped), for: .touchUpInside)
    
            let customView = UIView()
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(uploadPodcastButtonTapped))
            customView.isUserInteractionEnabled = true
            customView.addGestureRecognizer(tapGesture)
            
            let buttonTextLabel = UILabel()
            buttonTextLabel.text = "Upload your podcast"
            buttonTextLabel.textColor = .black
            buttonTextLabel.font = UIFont.boldSystemFont(ofSize: 26)
            
            let plusIconImageView = UIImageView(image: UIImage(named: "plus"))
            plusIconImageView.contentMode = .scaleAspectFit
            plusIconImageView.clipsToBounds = true
            
            customView.addSubview(buttonTextLabel)
            customView.addSubview(plusIconImageView)
            
            buttonTextLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview().offset(10)
                make.leading.equalTo(plusIconImageView.snp.trailing).offset(5)
            }
            
            plusIconImageView.snp.makeConstraints { make in
                make.centerY.equalToSuperview().offset(10)
                make.leading.equalToSuperview()
                make.width.height.equalTo(25)
            }
            
            button.addSubview(customView)
            
            return button
        }()

        let photoImageView = UIImageView(image: UIImage(named: "flag.png"))
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        
        view.addSubview(nameLabel)
        view.addSubview(userLabel)
        view.addSubview(joinedLabel)
        view.addSubview(distributionView)
        view.addSubview(inviteFriendsButton)
        view.addSubview(shareButton)
        view.addSubview(photoImageView)
        view.addSubview(uploadPodcastButton)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(8)
            make.trailing.equalTo(photoImageView.snp.leading).offset(-16)
            make.height.equalTo(25)
        }
        
        userLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.height.equalTo(13)
        }
        
        joinedLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(userLabel.snp.bottom).offset(8)
            make.height.equalTo(13)
        }
        
        distributionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(joinedLabel.snp.bottom).offset(13)
            make.height.equalTo(21)
        }
        
        inviteFriendsButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-38)
            make.top.equalTo(distributionView.snp.bottom).offset(13)
        
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(40)
        }
        
        shareButton.snp.makeConstraints { make in
            make.leading.equalTo(inviteFriendsButton.snp.trailing).offset(25)
            make.top.equalTo(distributionView.snp.bottom).offset(13)
            make.width.equalToSuperview().multipliedBy(0.13)
            make.height.equalTo(40)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalTo(nameLabel)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        uploadPodcastButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-38)
            make.top.equalTo(inviteFriendsButton.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(40)
        }
        return view
    }()
    
    private lazy var thirdView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemBackground

            let statisticsLabel = UILabel()
            statisticsLabel.text = "Statistics"
            statisticsLabel.textAlignment = .left
            statisticsLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold) 

            view.addSubview(statisticsLabel)
            statisticsLabel.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(8)
                make.height.equalTo(30)
            }

            return view
        }()
    
    private lazy var collectionView: UICollectionView = {
            let layout = CustomCollectionViewLayout()
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .clear
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
            return collectionView
        }()
    
    @objc private func handleInviteAction() {
            
            let alertController = UIAlertController(title: nil, message: "You can copy the link for now. Soon this page will be created.", preferredStyle: .alert)
            present(alertController, animated: true, completion: nil)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                alertController.dismiss(animated: true, completion: nil)
            }
        }

        @objc private func inviteFriendsTapped() {
            handleInviteAction()
        }

        @objc private func plusImageTapped() {
            handleInviteAction()
        }
    
    @objc private func shareAction() {
        print("Share action tapped!")

        let alertController = UIAlertController(title: nil, message: "Link copied!", preferredStyle: .alert)

        present(alertController, animated: true, completion: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }
    @objc private func uploadPodcastButtonTapped() {
        showImagePicker()
    }
    func showImagePicker() {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(photoView)
        view.addSubview(nameLabelView)
        view.addSubview(thirdView)
       
        let oneAndHalfFourthHeight = view.bounds.height * 1.1777 / 4.0
        
        photoView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(oneAndHalfFourthHeight)
        }
        
        nameLabelView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.trailing.equalToSuperview().offset(-7)
            make.top.equalTo(photoView.snp.bottom)
            make.height.equalTo(oneAndHalfFourthHeight * 0.9)
        }
        
        thirdView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.trailing.equalToSuperview().offset(-7)
            make.top.equalTo(nameLabelView.snp.bottom)
            
            make.height.equalTo(oneAndHalfFourthHeight * 1.2)
        }
        
        thirdView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(8)
                make.leading.trailing.bottom.equalToSuperview()
            }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell

        switch (indexPath.section, indexPath.item) {
        case (0, 0):
            cell.mainTextLabel.text = "1"
            cell.daySubTextLabel.text = "Day streak!"
        case (0, 1):
            cell.mainTextLabel.text = "7"
            cell.firstSubTextLabel.text = "Podcasts per day"
        case (0, 2):
            cell.mainTextLabel.text = "0"
            cell.firstSubTextLabel.text = "Your podcasts"
        case (0, 3):
            cell.mainTextLabel.text = "4"
            cell.firstSubTextLabel.text = "Linked friends"
        default:
            break
        }

        return cell
    }


    }

class CustomCollectionViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        minimumInteritemSpacing = 20
        minimumLineSpacing = 20

        let itemWidth = (collectionView.bounds.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing) / 2
        let itemHeight = collectionView.bounds.height / 3.3
        itemSize = CGSize(width: itemWidth, height: itemHeight)

        collectionView.contentInset.top = 44
    }
}

class CustomCollectionViewCell: UICollectionViewCell {
    let mainTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    let daySubTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemBlue
        label.textAlignment = .right
        return label
    }()
    
    let firstSubTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureCell() {
        layer.cornerRadius = 18
        layer.masksToBounds = true

        addSubview(mainTextLabel)
        addSubview(daySubTextLabel)
        addSubview(firstSubTextLabel)
        
        mainTextLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(33)
            make.centerY.equalToSuperview().offset(-17)
        }
        
        daySubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(7)
            make.centerX.equalToSuperview().offset(-6)
            
        }
        firstSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
        }

        backgroundColor = .systemGray5
    }
}
