import UIKit

class SeriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var seriesParseResult = SeriesParse()
    var data: [Series] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        seriesParseResult.delegate = self
        tableView.isHidden = true
        seriesParseResult.seriesParse()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serieCell") as! SeriesTableViewCell
        
        cell.setSeries(data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

extension SeriesViewController: SeriesParseDelegate {
    func seriesList(_ seriesList: [Series]) {
        data = seriesList
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }
    
    func seriesError(_ error: Error) {
        let viewController = UIAlertController(title: "Séries não encontrados", message: "Séries não disponiveis no momento", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        viewController.addAction(okAction)
        self.present(viewController, animated: true)
    }
    
    
}
