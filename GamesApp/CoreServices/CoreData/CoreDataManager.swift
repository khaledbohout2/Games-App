//
//  CoreDataManager.swift
//  GamesApp
//
//  Created by Khaled Bohout on 03/03/2023.
//

import Foundation
import CoreData

struct GameCoreDataRepository: GamesRepositoryDelegate {

    let container: NSPersistentContainer

    init(){
        container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { description, error in
            if error != nil {
                fatalError("Cannot Load Core Data Model")
            }
        }
    }

    func getLatest(pageNum: String, searchText: String?, completionHandler: @escaping (AFResult<BaseModelWithData<[Game]>>) -> Void){
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
            let response = BaseModelWithData(error: nil, results: games, count: games.count)
            completionHandler(.success(response))
        }
        catch {
            // Couldn't create audio player object, log the error
            print("Couldn't create the audio player for file")
            completionHandler(.failure(NSError.create(description: "")))
        }
    }

    private func saveContext(){
        let context = container.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }

}
