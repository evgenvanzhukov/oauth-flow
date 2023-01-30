//
//  FriendsViewController.swift
//  oauth flow
//
//  Created by Evgen on 21.01.2023.
//

import UIKit

class FriendsViewController: UITableViewController {

    var vkService: VKService!
    
    var friends: [Friend] = []
    
    init(_ service: VKService) {
        super.init(style: .grouped)
        self.vkService = service
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        vkService.GetFriends(count: 8, offset: 3) {[weak self] result in
            self?.friends = result
            self?.friends.removeAll(where: {$0.name == "DELETED"})
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")

        let friend = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.name) \(friend.surName ?? "")"
        
        cell.detailTextLabel?.text = "\(friend.status ?? "")"
        let sex = friend.sex == 1 ? "Жен" : "Муж"
        loadImage(from: friend.photo) {[weak self] (img) in
            cell.accessoryView = UIImageView(image: img)
        }
        
        return cell
    }
}


extension FriendsViewController {
    func loadImage(from url:String?, completion: @escaping (UIImage) -> Void ) {

            guard let stringUrl = url, let url = URL(string: stringUrl) else {
                return
            }
            
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                           completion(image)
                        }
                    }
                }
    }
}
