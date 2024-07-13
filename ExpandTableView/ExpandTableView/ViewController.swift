//
//  ViewController.swift
//  ExpandTableView
//
//  Created by Subhajit Biswas on 27/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var model = [DataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        tableView.delegate = self
        tableView .dataSource = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.idemtifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Logic For Expand
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model[indexPath.row].isExpanded.toggle()
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    
    // Normal tableView Delegates
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        model[indexPath.row].isExpanded ? 210 : 52
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCell.idemtifier,
            for: indexPath
        ) as! TableViewCell
        
        cell.cellLabel.text = model[indexPath.row].isExpanded ? ("\(model[indexPath.row].imageName) - Tap to Collaps") : ("\(model[indexPath.row].imageName) -  Tap to Expand")
        cell.cellImageView.image = UIImage(named: model[indexPath.row].imageName)
        
        return cell
    }
}

extension ViewController {
    private func fetchData() {
        ["Dog - Image", "Flower - Image", "Jhorna - Image", "Small House - Image"].map({
            model.append( DataModel(imageName: $0))
        })
    }
}


struct DataModel {
    let imageName: String
    var isExpanded: Bool = false
    
    init(
        imageName: String
    ) {
        self.imageName = imageName
    }
}




