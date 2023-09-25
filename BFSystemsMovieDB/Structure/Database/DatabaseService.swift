//
//  DatabaseService.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 25/09/23.
//

import Foundation
import CoreData
import UIKit

class MovieResultDal: NSManagedObject {
    @NSManaged var id: Int
    @NSManaged var overview: String
    @NSManaged var posterPath: String?
    @NSManaged var releaseDate: String
    @NSManaged var title: String
}

class DatabaseService {
    
    static let shared = DatabaseService()
    
    func add(movies: [MovieResult]) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext) else { return }
        
        
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        let ids: [Int]
        do {
            let moviesSaved = try managedContext.fetch(fetchRequest)
            ids = moviesSaved.map{ $0.value(forKey: "id") as! Int }
        } catch {
            ids = []
        }
        
        for movie in movies {
            if !ids.contains(movie.id) {
                let movieEntity = NSManagedObject(entity: entity, insertInto: managedContext)
                
                movieEntity.setValue(movie.id, forKey: "id")
                movieEntity.setValue(movie.title, forKey: "title")
                movieEntity.setValue(movie.releaseDate, forKey: "releaseDate")
                movieEntity.setValue(movie.overview, forKey: "overview")
                movieEntity.setValue(movie.posterPath, forKey: "posterPath")
            }
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetch() -> [MovieResult] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        //3
        do {
            let movies = try managedContext.fetch(fetchRequest)
            if !movies.isEmpty {
                
                return movies.map {
                    MovieResult(id: $0.value(forKey: "id") as! Int, overview: $0.value(forKey: "overview") as! String, posterPath: $0.value(forKey: "posterPath") as? String, releaseDate: $0.value(forKey: "releaseDate") as! String, title: $0.value(forKey: "title") as! String)
                }
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return []
    }
}
