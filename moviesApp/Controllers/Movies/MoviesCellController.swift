import UIKit

class MoviesViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var launchDate: UILabel!
    @IBOutlet weak var mediaNote: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieResume: UILabel!
    
    func setMovieCell (_ movie: Movies) {
        movieTitle.text = movie.title
        launchDate.text = movie.releaseDate
        mediaNote.text = String(movie.voteAverage)
        voteCount.text = String(movie.voteCount)
        movieResume.text = movie.resume
        guard let url = URL(string: movie.imageUrl.appending(movie.imageLinkId)) else {return}
        movieImage.loadImage(url: url)
        
    }
}
