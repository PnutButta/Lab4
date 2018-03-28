//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Angel Chara'e Mitchell on 2/27/18.
//  Copyright © 2018 Angel Chara'e Mitchell. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var chatMessageField: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    
    var message: String!
    var refresh: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        // Auto size row height based on cell autolayout constraints
        messageTableView.rowHeight = UITableViewAutomaticDimension
        // Provide an estimated row height. Used for calculating scroll indicator
        messageTableView.estimatedRowHeight = 73
        
        refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(ChatViewController.pullToRefresh(_:)),
                          for: .valueChanged)
        messageTableView.insertSubview(refresh, at: 0)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.pullToRefresh(_:)), userInfo: nil, repeats: true)

    }
    
    @objc func  pullToRefresh(_ refresh: UIRefreshControl) {
        
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text ?? ""
        message = chatMessage["text"] as! String
        
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        // add saved messages to tableview ? cell.messageLabel
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchMessages() {
      /*let post = Post()
        var query = post.query()
        query.getObjectInBackgroundWithId("imkmJsHVIH") {
            (post: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                print(post)
            } else {
                print(error)
            }
        }
        query.addDescendingOrder("createdAt") */
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
