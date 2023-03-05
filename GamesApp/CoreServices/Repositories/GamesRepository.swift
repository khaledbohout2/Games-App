//
//  GamesRepository.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import CoreData

protocol GamesRepositoryProtocol {
    func getLatest(pageNum: String?, searchText: String?) -> [Game]?
}

class newRepo: GamesRepositoryProtocol {
    let container: NSPersistentContainer
    init(container: NSPersistentContainer){
        self.container = container
        container.loadPersistentStores { description, error in
            if error != nil {
                fatalError("Cannot Load Core Data Model")
            }
        }
    }

    func getLatest(pageNum: String? = nil, searchText: String? = nil) -> [Game]? {
        let request = LatestGamesCoreDataEntity.fetchRequest()
        do {
            let games = try container.viewContext.fetch(request).map({ gameCoreDataEntity in
                Game(id: Int(gameCoreDataEntity.id), name: gameCoreDataEntity.name, backgroundImage: gameCoreDataEntity.backgroundImage, metacritic: Int(gameCoreDataEntity.metacritic), genres: gameCoreDataEntity.genres.map({ genres in
                    var genresArr = [Genre]()
                    for genre in genres {
                        genresArr.append(Genre(name: (genre as? GenreCoreDataEntity)?.name ?? ""))
                    }
                    return genresArr
                }))
            })
            return games
        }
        catch {
            return nil
        }
    }

    private func saveContext(){
        let context = container.viewContext
        if context.hasChanges {
            do{
                try context.save()
                // publish notifications
            }catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}

protocol GamesRepositoryDelegate {
    func getLatest(pageNum: String, searchText: String?, completionHandler: @escaping(AFResult<BaseModelWithData<[Game]>>) -> Void)
}

class GamesRepository: GamesRepositoryDelegate{

    private var network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }

    func getLatest(pageNum: String, searchText: String?, completionHandler: @escaping(AFResult<BaseModelWithData<[Game]>>) -> Void) {
        network.request(GamesNetworkRouter.getLatest(pageNum: pageNum, searchText: searchText),
                        decodeTo: BaseModelWithData<[Game]>.self,
                        completionHandler: completionHandler)
    }
}
