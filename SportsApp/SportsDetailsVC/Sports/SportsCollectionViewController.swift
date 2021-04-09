//
//  SportsCollectionViewController.swift
//  SportsApp
//
//  Created by Mina Hany on 3/22/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit
import SDWebImage
private let reuseIdentifier = "customSportsCell"

class SportsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    @IBOutlet var sportCollectionView: UICollectionView!
    
    var sportsArr : [Sports] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .red
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 4, bottom: 0, right: 4)
        callSportsAPI()
     //
        
        
        self.sportCollectionView.reloadData()
    }

    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if sportsArr != nil {
            return sportsArr.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (collectionView.frame.width / 2)-8,height: (collectionView.frame.height / 3 )-4)
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customSportsCell", for: indexPath) as! SportsCustomCollectionViewCell
        cell.sportImageView.sd_setImage(with: URL(string: sportsArr[indexPath.row].strSportThumb ?? ""))
        // Configure the cell
        cell.sportTitleLabel.text = sportsArr[indexPath.row].strSport
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    // MARK: UICollectionViewDelegate

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LeaguesTableViewController , let name = sender as? String{
            vc.nameSport = name
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showLeagues", sender: sportsArr[indexPath.row].strSport)
    }
//To Hit The Sports API
    func callSportsAPI(){
        NetworkLayer.shared.getDataFromAPI(api: "https://www.thesportsdb.com/api/v1/json/1/all_sports.php") { [weak self](data, error) in
            
                    let weakSelf = self
            var fetchedSports : [Sports] = []
                    if let dataDictionary = data as? [String:Any]{
                        if let sportsArray = dataDictionary["sports"] as? [Dictionary<String,Any>]{
                            for sport in sportsArray{
                                let newSport = Sports(dictionary: dataDictionary as NSDictionary)
                                newSport!.strSport = sport["strSport"] as? String
                                newSport!.strSportThumb = sport["strSportThumb"] as? String
                                newSport!.idSport = sport["idSport"] as?
                                    String
                                fetchedSports.append(newSport!)
                             //   print(newSport?.strSport)
                                }
                            
                            weakSelf?.sportsArr = fetchedSports
                            //print(weakSelf?.sportsArr[0].strSport)
                        }
                    }
           self!.sportCollectionView.reloadData()
        }
        
        
    }
}
