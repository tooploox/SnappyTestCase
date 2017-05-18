//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit

final class ExampleViewController: UIViewController, UITableViewDataSource {

    @IBOutlet private var tableView: UITableView!
    
    private static let placesOfInterest = [
        "Morskie Oko",
        "Orla Perć",
        "The Polish Black Pond",
        "Gerlachovský štít",
        "Kasprowy Wierch",
        "Giewont",
        "High Tatras",
        "Tatra National Park",
        "Bystrá"
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExampleViewController.placesOfInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: UITableViewCell.self),
            for: indexPath
        )
        cell.textLabel?.text = ExampleViewController.placesOfInterest[indexPath.row]
        return cell
    }
    
}
