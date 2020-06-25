//
//  ViewController.swift


import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [Item]()
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Buy eggs"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Clean house"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Laundry"
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)


        
//        if let itemArray = userDefault.array(forKey: "itemArray") as? [String] {
//            self.itemArray = itemArray
//        }
    }
    
    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("CEll for row at index path called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
//        if item.check == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        cell.accessoryType = item.check ? .checkmark : .none
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        //Toggle check mark
//        if itemArray[indexPath.row].check == true {
//            itemArray[indexPath.row].check = false
//        } else {
//            itemArray[indexPath.row].check = true
//        }
//
        itemArray[indexPath.row].check = !itemArray[indexPath.row].check
        tableView.reloadData()

        //this will remove selected table row color
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Item
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
//            self.itemArray.append(textField.text!)
            self.userDefault.set(self.itemArray, forKey: "itemArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

