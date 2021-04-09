//
//  UpComingEventsView.swift
//  SportsApp
//
//  Created by moutaz hegazy on 3/20/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import UIKit

class UpComingEventsView: UIView{
    
    var header = EventHeaderCollectionReusableView()
    @IBOutlet weak var eventsCollectionView:UICollectionView!
    var events :[Event] = [] {
        didSet{
            eventsCollectionView.reloadData()
            
        }
    }
}

extension UpComingEventsView : UICollectionViewDelegate{
    
    
    
}

extension UpComingEventsView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath)
        if let eventCell = cell as? EventCollectionViewCell{
            eventCell.layer.cornerRadius = 10
            eventCell.layer.borderColor = UIColor.white.cgColor
            eventCell.layer.borderWidth = 2
            
            eventCell.eventNameLabel.text = events[indexPath.row].eventName
            eventCell.eventDateLabel.text = events[indexPath.row].eventDate
            eventCell.eventTimelabel.text = events[indexPath.row].eventTime
            
            
        }
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        // 2
        case UICollectionView.elementKindSectionHeader:
          // 3
          guard
            let headerView = collectionView.dequeueReusableSupplementaryView(
              ofKind: kind,
              withReuseIdentifier: "EventHeaderCollectionReusableView",
              for: indexPath) as? EventHeaderCollectionReusableView
            else {
              fatalError("Invalid view type")
          }

          headerView.headerLabel.text = "Upcoming Events"
          headerView.headerLabel.transform = CGAffineTransform(rotationAngle: 3.14/2)
          return headerView
        default:
          // 4
          assert(false, "Invalid element type")
        }
    }
}

extension UpComingEventsView : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.frame.width/2 + 48, height: self.frame.height - 48)
        return size
    }
    
}
