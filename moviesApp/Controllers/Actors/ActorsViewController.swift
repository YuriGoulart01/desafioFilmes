import UIKit

class ActorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var actors = ActorsParse()
    var knownFor = KnownForCell()
    var data: [Actors] = []
    var selectedIndex = 0
    
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
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "actorsKnownFor", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "actorsKnownFor" {
            if let vc = segue.destination as? KnownForViewController, let knowFor = data[selectedIndex].KnowFor, !knowFor.isEmpty {
                vc.data = knowFor
            } else {
                let viewController = UIAlertController(title: "Filmes não encontrados", message: "O autor selecionado não possui filmes", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                viewController.addAction(okAction)
                self.present(viewController, animated: true)
            }
        }
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
