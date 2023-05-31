//
//  DataBaseManager.swift
//  Club Info
//
//  Created by ammar on 30/05/2023.
//

import Foundation
import CoreData
class DatabaseManager {
    private init(){
        
    }
    private static var instans = DatabaseManager()
    static func getInstans()->DatabaseManager{
        return instans
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Club_Info")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Failed to load Core Data stack: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    
    func saveTeam(withData data: Team) {
        let managedObjectContext = persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TeamEntity", in: managedObjectContext) else {
            fatalError("Failed to create entity description for TeamEntity")
        }
        
        let team = TeamEntity(entity: entity, insertInto: managedObjectContext)
        team.id = Int32(data.teamKey ?? 0)
        team.teamName = data.teamName
        team.teamLogo = data.teamLogo
        
        saveContext()
    }
      
     func fetchAllTeams() -> [Team] {
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<TeamEntity> = TeamEntity.fetchRequest()
        
        do {
            let teamEntity = try managedObjectContext.fetch(fetchRequest)
            return teamEntity.map { teamEntity in
                Team(
                    teamKey: Int(  teamEntity.id ),
                    teamLogo: teamEntity.teamLogo ,
                    teamName:  teamEntity.teamName
                    
                )
            }
        } catch {
            fatalError("Failed to fetch teams: \(error)")
        }
    }
    
    func deleteTeam(withId id: Int) {
            let managedObjectContext = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<TeamEntity> = TeamEntity.fetchRequest()

            // Set a predicate to fetch the meal entity with the matching show_id
            fetchRequest.predicate = NSPredicate(format: "id == %@", NSNumber(value: id))

            do {
                let teamEntities = try managedObjectContext.fetch(fetchRequest)

                guard let teamEntity = teamEntities.first else {
                    
                    return
                }

                managedObjectContext.delete(teamEntity)
                saveContext()
            } catch {
                fatalError("Failed to fetch or delete team: \(error)")
            }
        }
    
    // MARK: - Core Data Stack
    
    private func saveContext() {
        let managedObjectContext = persistentContainer.viewContext
        managedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Failed to save managed object context: \(error)")
            }
        }
    }
}
