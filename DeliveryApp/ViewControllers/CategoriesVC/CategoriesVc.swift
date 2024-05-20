//
//  CategoriesVc.swift
//  DeliveryApp
//
//  Created by MAC PRO on 18/03/24.
//

import UIKit

class CategoriesVc: UIViewController {
    
    @IBOutlet weak var itemTitleLbl: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var notifyBtn: UIButton!
    
    @IBOutlet weak var MyCategoriesTblVw: UITableView!
    
    struct Category {
        let name: String
        let image: String
    }
    
    private var data: [Category]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        BackGesture.addBackGesture(to: self, action: #selector(handleSwipeGesture))
        
        self.backBtn.layer.borderWidth = 2.0
        self.backBtn.layer.borderColor = UIColor.secondarySystemFill.cgColor
        
        self.backBtn.layer.cornerRadius = 15
        
        self.MyCategoriesTblVw.register(UINib(nibName: "ItemCategoriesCell", bundle: nil), forCellReuseIdentifier: "ItemCategoriesCell")
        
        self.MyCategoriesTblVw.showsVerticalScrollIndicator = false
        self.MyCategoriesTblVw.backgroundColor = .none
        
        self.data = [Category(name: "Foods", image: "foodCgt"),
                     Category(name: "Juice", image: "juice"),
                     Category(name: "Cake", image: "cake"),
                     Category(name: "Snacks", image: "snack"),
                     Category(name: "Desert", image: "desert")
        ]
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            // Perform pop action to go back
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func searchBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SearchVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func notifyBtnTapped(_ sender: Any) {
    }
    
    
}

extension CategoriesVc: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCategoriesCell", for: indexPath) as! ItemCategoriesCell
        let category = data[indexPath.section]
        
        cell.nameLbl.text = category.name
        cell.foodimageVw.image = UIImage(named: category.image)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let VC = storyboard?.instantiateViewController(identifier: "FoodItemVC")
            navigationController?.pushViewController(VC!, animated: true)
        case 1:
            let VC = storyboard?.instantiateViewController(identifier: "JuiceItemVC")
            navigationController?.pushViewController(VC!, animated: true)
        case 2:
            let VC = storyboard?.instantiateViewController(identifier: "DessertItemVC")
            navigationController?.pushViewController(VC!, animated: true)
        case 3:
            let VC = storyboard?.instantiateViewController(identifier: "CakeItemVC")
            navigationController?.pushViewController(VC!, animated: true)
        case 4:
            let VC = storyboard?.instantiateViewController(identifier: "snackItemVC")
            navigationController?.pushViewController(VC!, animated: true)
        default:
            break
        }
    }
}
