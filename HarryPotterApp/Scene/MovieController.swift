//
//  MovieController.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 03.01.25.
//

import UIKit

class MovieController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var movieBackImage: UIImageView!
    
    var movies = [MovieModel]()
    
    var detailMovies = [DetailMovies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
    }
    
    func configureUi() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        getMovieData()
        getDetailMovies()
    }
    
    func getMovieData() {
        if let fileUrl = Bundle.main.url(forResource: "Movies", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                movies = try JSONDecoder().decode([MovieModel].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getDetailMovies() {
        if let fileUrl = Bundle.main.url(forResource: "PlayMovie", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                detailMovies = try JSONDecoder().decode([DetailMovies].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

extension MovieController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieCell.self)", for: indexPath) as! MovieCell
        cell.callBackData(name: movies[indexPath.row].name ?? "", image: movies[indexPath.row].image ?? "", time: movies[indexPath.row].time ?? "", year: movies[indexPath.row].year ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width , height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "\(DetailMovieController.self)") as!
        DetailMovieController
        controller.movieLink = detailMovies[indexPath.row].name ?? ""
        navigationController?.show(controller, sender: nil)
    }
}
