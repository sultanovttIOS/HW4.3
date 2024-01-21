//
//  SecondViewController.swift
//  HW4.3
//
//  Created by Alisher Sultanov on 21/1/24.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var contacts: [Contact] = []
    private let cellID = "cell"
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        return view
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = contacts[indexPath.row].name
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        if let originalImage = UIImage(named: contacts[indexPath.row].image) {
            let resizedImage = originalImage.resize(targetSize: CGSize(width: 40, height: 40))
            cell.imageView?.image = resizedImage
            cell.imageView?.layer.cornerRadius = 20 
            cell.imageView?.clipsToBounds = true
            cell.imageView?.contentMode = .scaleAspectFill
        }
        cell.detailTextLabel?.text = contacts[indexPath.row].phoneNumber
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        cell.detailTextLabel?.textColor = .lightGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        title = "My Contacts"
        navigationController?.navigationBar.tintColor = .purple
        view.backgroundColor = .secondarySystemBackground
        
        setupTableView()
        setupData()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom)
        }
        
    }
    
    private func setupData() {
        contacts = [Contact(image: "1", name: "Jane Cooper", phoneNumber: "(+996) 555-0117"),
                    Contact(image: "2", name: "Devon Lane", phoneNumber: "(+996) 555-0121"),
                    Contact(image: "3", name: "Darrell Steward", phoneNumber: "(996) 555-0102"),
                    Contact(image: "4", name: "Devon Lane", phoneNumber: "(996) 555-0102"),
                    Contact(image: "5", name: "Courtney Henry", phoneNumber: "(996) 555-0125"),
                    Contact(image: "6", name: "Wade Warren", phoneNumber: "(996) 555-0118"),
                    Contact(image: "7", name: "Bessie Cooper", phoneNumber: "(+996) 555-0120"),
                    Contact(image: "8", name: "Robert Fox", phoneNumber: "(996) 555-0103"),
                    Contact(image: "9", name: "Jacob Jones", phoneNumber: "(+996) 555-0122"),
                    Contact(image: "10", name: "Jenny Wilson", phoneNumber: "(+996) 555-0108")]
    }
}

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
