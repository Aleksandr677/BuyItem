//
//  HomeViewController.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let categories = SelectCategoryModel.fetchItem()
    let cellCategory = SelectItemTableViewCell()
    
    let homeTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.showsHorizontalScrollIndicator = false
        table.register(SelectItemTableViewCell.self, forCellReuseIdentifier: "SelectItemTableViewCell")
        table.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        table.register(HotSalesTableViewCell.self, forCellReuseIdentifier: "HotSalesTableViewCell")
        table.register(BestSellerTableViewCell.self, forCellReuseIdentifier: "BestSellerTableViewCell")
        
        table.register(SelectCategoryHeader.self, forHeaderFooterViewReuseIdentifier: "selectCategoryHeader")
        table.register(HotSalesHeader.self, forHeaderFooterViewReuseIdentifier: "hotSalesHeader")
        table.register(BestSellerHeader.self, forHeaderFooterViewReuseIdentifier: "bestSellerHeader")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        homeTableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        setUpUI()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-filter"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(filterButtonPressed))
        navigationItem.hidesBackButton = true
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    private func setUpUI() {
    
        //navBar
        let imagePointer = makeImageView(with: "ic-point")
        let labelPointer = makeLabel(withText: "Zihuatanejo, Gro")
        labelPointer.font = UIFont(name: "Mark Pro Medium", size: 15)
        labelPointer.textColor = UIColor(named: "MyBlackBlue")
        let imageChevron = makeImageView(with: "ic-chevron")
        imageChevron.tintColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        
        view.addSubview(imagePointer)
        view.addSubview(labelPointer)
        view.addSubview(imageChevron)
        
        view.addSubview(homeTableView)
        
        //navBar
        NSLayoutConstraint.activate([
            imagePointer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 132),
            imagePointer.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            
            labelPointer.leadingAnchor.constraint(equalTo: imagePointer.trailingAnchor, constant: 11),
            labelPointer.centerYAnchor.constraint(equalTo: imagePointer.centerYAnchor),
            
            imageChevron.leadingAnchor.constraint(equalTo: labelPointer.trailingAnchor, constant: 8),
            imageChevron.centerYAnchor.constraint(equalTo: imagePointer.centerYAnchor),
            imageChevron.heightAnchor.constraint(equalToConstant: 5),
            imageChevron.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        //tableView
        NSLayoutConstraint.activate([
            homeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18)
        ])
    }
    
    //functions
    @objc func filterButtonPressed() {
        let detailVC = FilterViewController()
        if let sheet = detailVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 15
        }
        present(detailVC, animated: true, completion: nil)
    }
    
    @objc func seeMoreButtonPressed() {
        self.navigationController?.pushViewController(ProductDetailsViewController(), animated: true)
    }
}

//MARK: - Delegate method
extension HomeViewController: HotSalesCollectionViewDelegate {
    func didTapCell() {
        self.navigationController?.pushViewController(ProductDetailsViewController(), animated: true)
    }
}

//MARK: - Table view delegate methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cellCategory = tableView.dequeueReusableCell(withIdentifier: "SelectItemTableViewCell") as? SelectItemTableViewCell else { return UITableViewCell() }
            cellCategory.fetchCells(cells: categories)
            return cellCategory
        } else if indexPath.section == 1 {
            guard let cellSearch = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as? SearchTableViewCell else { return UITableViewCell() }
            return cellSearch
        } else if indexPath.section == 2 {
            guard let cellHot = tableView.dequeueReusableCell(withIdentifier: "HotSalesTableViewCell") as? HotSalesTableViewCell else { return UITableViewCell() }
            cellHot.getHotSalesPhone()
            cellHot.delegateView = self
            return cellHot
        } else {
            guard let cellBest = tableView.dequeueReusableCell(withIdentifier: "BestSellerTableViewCell") as? BestSellerTableViewCell else { return UITableViewCell() }
            cellBest.getBestSellerPhone()
            cellBest.delegateView = self
            return cellBest
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 94
        } else if indexPath.section == 1 {
            return 34
        } else if indexPath.section == 2 {
            return 200
        } else if indexPath.section == 3 {
            return 650
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 56
        } else if section == 1 {
            return 35
        } else if section == 2{
            return 56
        } else if section == 3{
            return 35
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "selectCategoryHeader") as! SelectCategoryHeader
            return view
        } else if section == 2 {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "hotSalesHeader") as! HotSalesHeader
            view.seeMoreHotButton.addTarget(self, action: #selector(seeMoreButtonPressed), for: .touchUpInside)
            return view
        } else if section == 3 {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "bestSellerHeader") as! BestSellerHeader
            view.seeMoreBestButton.addTarget(self, action: #selector(seeMoreButtonPressed), for: .touchUpInside)
            return view
        }
        return nil
    }
}
