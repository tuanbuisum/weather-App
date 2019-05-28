//
//  HomeViewController.swift
//  JSONweatherAPI
//
//  Created by Admin on 5/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

struct Dota {
    var time: String?
    var image : String?
    var temp : String?
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var uiCLSView: UICollectionView!
    
    @IBOutlet weak var uiTableView: UITableView!
    
    var data = [Dota]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather.forcast(withLocation: "37.8267,-122.4233") { (results: [weather] ) in
            for results in results{
                print("\(results)\n\n")
                
            }
        }
        setupCollection()
        setupTableView()
    }
    
    func setupCollection() {
        let nibName = UINib(nibName: "TemplateCollectionViewCell", bundle: nil)
        uiCLSView.delegate = self
        uiCLSView.dataSource = self
        uiCLSView.isPagingEnabled = true
        uiCLSView.showsHorizontalScrollIndicator = false
        uiCLSView.register(nibName, forCellWithReuseIdentifier: "TemplateCollectionViewCell")
        setupLayoutP()
    }
    
    func setupLayoutP() {
        if let flowLayOut = uiCLSView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayOut.itemSize = CGSize(width:40, height: 70 )
            flowLayOut.minimumInteritemSpacing = 5
            flowLayOut.minimumLineSpacing = 5
            flowLayOut.scrollDirection = .horizontal
        }
        
    }
    
    func setupTableView() {
        let nibName = UINib(nibName: "DayTableViewCell", bundle: nil)
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.isPagingEnabled = true
        uiTableView.showsHorizontalScrollIndicator = false
        uiTableView.register(nibName, forCellReuseIdentifier: "DayTableViewCell")
    }
    
    
    
    func setupData(){
        let a = Dota(time: "12:00", image: "g", temp: "Mua")
        data.append(a)
        
    }
    
}

// MARK: extention controller add tableview

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TemplateCollectionViewCell", for: indexPath)

        return cell
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayTableViewCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
}
