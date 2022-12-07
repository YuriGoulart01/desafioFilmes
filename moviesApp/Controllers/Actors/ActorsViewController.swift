import UIKit

class ActorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var actors = ActorsParse()
    var data: [Actors] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        actors.delegate = self
        tableView.isHidden = true
        actors.actorsParse()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell") as! ActorCell
        
        cell.setActor(data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ActorsViewController: ActorsParseDelegate {
    func actorsList(_ actorsList: [Actors]) {
        data = actorsList
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }
    
    func ActorsError(_ error: Error) {
        print(error)
    }
    
    
}
