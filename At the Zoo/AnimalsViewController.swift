//
//  AnimalsViewController.swift
//  At the Zoo
//
//  Created by Amanda Green on 9/21/20.
//

import UIKit

class AnimalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedCategory:String = ""
    var selectedAnimal:String = ""
    
    
    var australia:[String] = ["Emu", "Koala", "Kangaroo", "Ring-Tailed Lemur"]
    var amazon:[String] = ["Jaguar", "Howler Monkey", "Orinoco Crocodile", "Giant River Otter"]
    var africa:[String] = ["Black Rhino", "African Elephant", "Giraffe", "Zebra", "Lowland Gorilla", "Chimpanzee", "African Lion"]
    var asia:[String] = ["Asian Elephant", "Greater One-Horned Rhino", "Sloth Bear", "Sumatran Tiger", "Clouded Leopard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (selectedCategory == "Australia") {
            return australia.count
        } else if (selectedCategory == "Amazon") {
            return amazon.count
        } else if (selectedCategory == "Africa") {
            return africa.count
        } else {
            return asia.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (selectedCategory == "Australia") {
            cell?.textLabel?.text = australia[indexPath.row]
        } else if (selectedCategory == "Amazon") {
            cell?.textLabel?.text = amazon[indexPath.row]
        } else if (selectedCategory == "Africa") {
            cell?.textLabel?.text = africa[indexPath.row]
        } else {
            cell?.textLabel?.text = asia[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "detatilSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailsViewController {
            let indexPath = self.tableView.indexPathForSelectedRow
            let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
            selectedAnimal = currentCell.textLabel!.text!
            destination.animalName = selectedAnimal
            
            print(selectedCategory)
            
        }
    }
}
