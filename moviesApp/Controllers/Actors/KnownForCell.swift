import UIKit

class KnownForCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieLaunchDate: UILabel!
    @IBOutlet weak var movieMediaNote: UILabel!
    @IBOutlet weak var movieNumberOfVotes: UILabel!
    @IBOutlet weak var movieResume: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    func setMovieKnownFor (_ movie: Movies) {
        movieTitle.text = movie.title
        movieLaunchDate.text = movie.releaseDate
        movieMediaNote.text = String(movie.voteAverage)
        movieNumberOfVotes.text = String(movie.voteCount)
        movieResume.text = movie.resume
        guard let url = URL(string: movie.imageUrl.appending(movie.imageLinkId)) else {return}
        movieImage.loadImage(url: url)
    }
}
