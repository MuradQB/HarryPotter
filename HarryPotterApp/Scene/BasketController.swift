//
//  BasketControllerViewController.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 03.01.25.
//

import UIKit

class BasketController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var manager = FileManagerHelper()
    
    var basketProducts = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
  }
    
    func configureUi() {
        title = "Selections"
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "BasketItemCell", bundle: nil), forCellReuseIdentifier: "BasketItemCell")
        manager.readData { items in
            self.basketProducts = items
        }
    }
}

extension BasketController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketItemCell") as! BasketItemCell
        cell.showData(image: basketProducts[indexPath.row].image ?? "", house: basketProducts[indexPath.row].house ?? "", item: basketProducts[indexPath.row].name ?? "", price: basketProducts[indexPath.row].price ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            basketProducts.remove(at: indexPath.row)
            manager.writeData(product: basketProducts)
            tableView.reloadData()
        }
    }
}
