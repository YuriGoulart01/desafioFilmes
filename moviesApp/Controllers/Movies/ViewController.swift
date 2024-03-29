import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var movieParseResult = MoviesParse()
    var data: [Movies] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        movieParseResult.delegate = self
        activityIndicator.startAnimating()
        tableView.isHidden = true
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
            self?.activityIndicator.stopAnimating()
            self?.tableView.isHidden = false
        }
    }
    
    func moviesError(_ error: Error) {
        let viewController = UIAlertController(title: "Filmes não encontrados", message: "Filmes não encontrados tente novamente mais tarde", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        viewController.addAction(okAction)
        self.present(viewController, animated: true)
    }
    
    
}

