import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieParseResult = MoviesParse()
    var data: [Movies] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        movieParseResult.delegate = self
        movieParseResult.moviesParse()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MoviesViewCell
        
        cell.setMovieCell(data[indexPath.row])
        
        return cell
        
    }


}

extension ViewController: MoviesParseDelegate {
    func moviesList(_ moviesList: [Movies]) {
        data = moviesList
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func moviesError(_ error: Error) {
    }
    
    
}

