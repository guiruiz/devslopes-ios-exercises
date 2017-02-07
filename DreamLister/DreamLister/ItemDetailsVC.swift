//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Guilherme Ruiz on 30/01/17.
//  Copyright © 2017 Guilherme Ruiz. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var itemTypePicker: UIPickerView!
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var thumbImage: UIImageView!
    
    var stores = [Store]()
    var itemTypes = [ItemType]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.dataSource = self
        storePicker.delegate = self
        
        itemTypePicker.dataSource = self
        itemTypePicker.delegate = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        getItemTypes()
        getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            let itemType = itemTypes[row]
            return itemType.type
        } else {
            let store = stores[row]
            return store.name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return itemTypes.count
        } else {
            return stores.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
    func getItemTypes(){
        let fetchRequest: NSFetchRequest<ItemType> = ItemType.fetchRequest()
        do {
            self.itemTypes = try context.fetch(fetchRequest)
            self.itemTypePicker.reloadAllComponents()
        } catch {
            
        }
    }
    
    func getStores(){
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let item: Item!
        
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        let picture = Image(context: context)
        picture.image = thumbImage.image
        item.toImage = picture
        
        if let title = titleField.text {
            item.title = title
        }
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        if let details = detailsField.text {
            item.details = details
        }
        
        item.toItemType = itemTypes[itemTypePicker.selectedRow(inComponent: 0)]
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        appDelegate.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData() {
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            
            thumbImage.image = item.toImage?.image as? UIImage
            
            if let itemType = item.toItemType {
                for (index, it) in itemTypes.enumerated() {
                    if it.type! == itemType.type {
                        itemTypePicker.selectRow(index, inComponent: 0, animated: false)
                    }
                }
            }
            
            if let store = item.toStore {
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                } while (index < stores.count )
            }
            
            
            
        }
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            appDelegate.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbImage.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func generateTestData(){
        let store = Store(context: context)
        store.name = "Best Buy"
        let store2 = Store(context: context)
        store2.name = "Tesla Dealership"
        let store3 = Store(context: context)
        store3.name = "Frys Eletronics"
        let store4 = Store(context: context)
        store4.name = "Target"
        let store5 = Store(context: context)
        store5.name = "Amazon"
        let store6 = Store(context: context)
        store6.name = "K Mart"
        
        let itemType = ItemType(context: context)
        itemType.type = "Electronics"
        let itemType2 = ItemType(context: context)
        itemType2.type = "Cars"
        let itemType3 = ItemType(context: context)
        itemType3.type = "Clothes"
        
        appDelegate.saveContext()
    }
}
