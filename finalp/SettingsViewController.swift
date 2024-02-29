import UIKit
import SnapKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .singleLine
        table.tableFooterView = UIView()
        return table
    }()
    
    private let cellIdentifier = "SettingsCell"
    private var selectedIndexPath: IndexPath?
    private let label = UILabel()
    private var data: [[String]] = [
        ["General", "Notifications", "Appearence", "Privacy and Security", "Data and Storage", "Screen time", "Language", "TV Provider", "Support service","Mode", "Clear cache", "Ask a Question",  "About the App"]
    ]
    private let icons: [String] = ["books.vertical", "message.badge.circle.fill", "photo.fill.on.rectangle.fill", "person.badge.key","tray.full.fill", "clock.arrow.circlepath", "pencil.and.outline", "network", "bandage.fill", "circle.lefthalf.filled", "basket.fill", "questionmark.app.dashed", "atom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel()
        setupTableView()
    }
    
    private func setupLabel() {
        label.text = "Settings"
        label.font  = UIFont.systemFont(ofSize: 40, weight: .bold) 
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(33)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            if indexPath.row < icons.count {
                let iconImage = UIImage(systemName: icons[indexPath.row])
                let iconImageView = UIImageView(image: iconImage)
                iconImageView.tintColor = .systemBlue
                cell.imageView?.image = iconImageView.image
                cell.imageView?.contentMode = .scaleAspectFit
                iconImageView.snp.makeConstraints { make in
                    make.width.height.equalTo(45)
                }
            }
            cell.textLabel?.font = UIFont.systemFont(ofSize: 21)
            cell.textLabel?.text = data[indexPath.section][indexPath.row]

            if indexPath == selectedIndexPath {
                let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
                arrowImageView.tintColor = .systemBlue
                arrowImageView.contentMode = .scaleAspectFit
                cell.accessoryView = arrowImageView
            } else {
                cell.accessoryView = nil
            }

            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if selectedIndexPath == indexPath {
                selectedIndexPath = nil
            } else {
                selectedIndexPath = indexPath
            }
            tableView.reloadData()
        }
    }
