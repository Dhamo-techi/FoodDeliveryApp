//
//  Sidemenubar.swift
//  DeliveryApp
//
//  Created by MAC PRO on 07/02/24.
//

import Foundation
import UIKit
import CoreData

class SidebarMenuView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var sidebarMenuView: UIButton?
    
    var result = [Any]()
    
    var passfinal = NSManagedObject()
    
    weak var delegate: SidebarMenuViewDelegate?
    
    var tableView: UITableView!
    var emptyView: UIView!
    var Sidemenuitems : [[String : String]] = [["name" : "Profile", "subname" : "See my profile"],["name" : "Categories", "subname" : "See all categories"],["name" : "Cart", "subname" : "See my cart items"],["name" : "Payment Card", "subname" : "See my payment card option"],["name" : "Push-Notifications", "subname" : "Set up push notification"],["name" : "Logout", "subname" : "Logut this Account"]]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    
    
    private func setupViews() {
        // Initialize and configure
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 60
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        addSubview(containerView) // Add the container view to the superview
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 240),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        self.tableView.register(UINib(nibName: "SidemenuCell", bundle: nil), forCellReuseIdentifier: "SidemenuCell")
        tableView.separatorStyle = .none
        
        self.fetchdata()
        
        let imageview = UIImageView(frame: CGRect(x: 20, y: 120, width: 90, height: 90))
        imageview.image = UIImage(named: "profileLuffy")
        imageview.layer.cornerRadius = 27
        imageview.clipsToBounds = true
        addSubview(imageview)
        
        let UsernameLbl = UILabel(frame: CGRect(x: 120, y: 130, width: 200, height: 40))
        UsernameLbl.textColor = UIColor.black
        UsernameLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        addSubview(UsernameLbl)
        
        let subUsernameLbl = UILabel(frame: CGRect(x: 120, y: 160, width: 200, height: 40))
        subUsernameLbl.textColor = UIColor.lightGray
        subUsernameLbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        addSubview(subUsernameLbl)
        
        if let userProfileData = result.first as? UserProfileData {
            UsernameLbl.text = userProfileData.userName
            subUsernameLbl.text = "@\(userProfileData.userEmail ?? "")"
        } else {
        }
        
        let cancelBtn = UIButton(type: .system)
        
        cancelBtn.frame = CGRect(x: 20, y: 45, width: 40, height: 40)
        cancelBtn.layer.cornerRadius = 12
        cancelBtn.layer.borderWidth = 2
        cancelBtn.layer.borderColor = UIColor.lightGray.cgColor
        cancelBtn.tintColor = UIColor.black
        
        let image = UIImage(systemName: "xmark")
        cancelBtn.setImage(image, for: .normal)
        
        let smallConfiguration = UIImage.SymbolConfiguration(pointSize: 4.0)
        let smallImage = image?.withConfiguration(smallConfiguration)
        cancelBtn.setImage(smallImage, for: .normal)
        
        let boldImage = image?.withRenderingMode(.alwaysOriginal).applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .bold))
        
        cancelBtn.setImage(boldImage, for: .normal)
        
        //        cancelBtn.addTarget(self, action: #selector(cancelBtnTapped(_:)), for: .touchUpInside)
        
        cancelBtn.addTarget(self, action: #selector(cancelBtnTapped(_:)), for: .touchUpInside)
        
        addSubview(cancelBtn)
        
    }
    
    func fetchdata(){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName:"UserProfileData")
        
        do {
            self.result = try context.fetch(fetchrequest)
        } catch let err as NSError {
            print(err.localizedDescription)
        }
    }
    
    @objc func cancelBtnTapped(_ sender: UIButton) {
        // Handle button tap action
        delegate?.sidebarMenuDidCancel()
        //        print("Button tapped")
    }
    
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        if let sidebarMenuView = sidebarMenuView,
           sidebarMenuView.frame.origin.x == 0 {
            UIView.animate(withDuration: 0.5) {
                sidebarMenuView.frame.origin.x = -sidebarMenuView.frame.width
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sidemenuitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SidemenuCell") as! SidemenuCell
        cell.NameLBL.text = self.Sidemenuitems[indexPath.row]["name"]
        cell.subnameLBL.text = self.Sidemenuitems[indexPath.row]["subname"]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItemName = self.Sidemenuitems[indexPath.row]["name"] ?? ""
        delegate?.sidebarMenuDidSelect(itemName: selectedItemName)
    }
    
    
}

