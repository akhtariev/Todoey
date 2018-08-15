//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Roman Akhtariev on 2018-07-29.
//  Copyright © 2018 Roman Akhtariev. All rights reserved.
//

import UIKit
import RealmSwift
import MDFTextAccessibility

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categories : Results<Category>?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }
    
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text  = categories?[indexPath.row].name ?? "No categories added yet"
        
        cell.backgroundColor = UIColor(categories?[indexPath.row].color ?? "#1D9BF6")
        
        cell.textLabel?.textColor = MDFTextAccessibility.textColor(onBackgroundColor: cell.backgroundColor!, targetTextAlpha: 1, font: nil)
        

        

        
        return cell
    }
    
    
    
    //MARK: - Data Manipulation Methods
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        tableView.reloadData()
        
    }
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving categories \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    //MARK: - Delete Data From Swipe
    
    override func updateModel(at indexPath: IndexPath) {
        
        
            if let categoryForDeletion = self.categories?[indexPath.row] {
                do {
                    try self.realm.write {
                        self.realm.delete(categoryForDeletion)
                    }
                } catch {
                    print("Error deleting category, \(error)")
                }
            }
    }


    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            newCategory.color = self.generateRandomColor().hexString()
            
            self.save(category: newCategory)
            
         
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("perform \(indexPath.row)")
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            print(indexPath.row)
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
}


