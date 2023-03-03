//
//  GamesVCPresenter.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import Foundation

protocol GamesVCPresenterDelegate: BasePresenterProtocol {
    func getGamesCount() -> Int
    func configure(cell: GameCellDelegate, for index: Int)
    func didSelect(index: Int)
}

class GamesVCPresenter: GamesVCPresenterDelegate {

    private weak var view: GamesVCViewDelegate?
    private let router: GamesVCRouter
    private var repository: GamesRepositoryDelegate

    var pageNumber = 1
    var totalCount = 1

    var games = [Game]() {
        didSet {
            guard games.count > 0 else {
                view?.fetchingDataSuccess(success: false)
                return
            }
            view?.fetchingDataSuccess(success: true)
        }
    }

    init(view: GamesVCViewDelegate?,
         router: GamesVCRouter,
         repository: GamesRepositoryDelegate) {
        self.view = view
        self.router = router
        self.repository = repository
    }

    func viewDidLoad() {
        view?.setLeftNavTitle()
        getRecentGames(pageNum: "\(pageNumber)")
    }

    func getGamesCount() -> Int {
        return games.count
    }

    func configure(cell: GameCellDelegate, for index: Int) {
        let game = games[index]
        cell.displayTitle(title: game.name ?? "")
        cell.displayImage(image: game.backgroundImage ?? "")
        cell.displayMetacritic(metacritic: "\(game.metacritic ?? 0)")
        cell.displayGenre(genre: (game.genres?.map { $0.name ?? "" }.joined(separator: ", ")) ?? "")
        if index > games.count - 2 && games.count < totalCount {
            pageNumber += 1
            getRecentGames(pageNum: "\(pageNumber)")
        }
    }

    func didSelect(index: Int) {}

    func getRecentGames(pageNum: String) {
        view?.startLoading(message: nil)
        repository.getLatest(pageNum: pageNum) { [weak self] response in
            guard let self = self else {return}
            guard let data = self.handleRequestResponse(response, inView: self.view, withRouter: self.router),
                  let games = data.results else {
                self.view?.fetchingDataSuccess(success: false)
                return
            }
            self.games.append(contentsOf: games)
            self.totalCount = data.count ?? 1
        }
    }

}
