//
//  AddCalendarEvent.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 04/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import Foundation
import EventKit

class AddCalendarEvent {
    

    func addToCalendar() -> Bool{
        
        var addCalendar = false
        
        let eventStore:EKEventStore = EKEventStore()
        eventStore.requestAccess(to: .event) {(granted, error) in

            if (granted) && (error == nil) {
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                event.title = "Tennis Match Event"
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "Tennis Match Event"
                event.calendar = eventStore.defaultCalendarForNewEvents
                
                do{
                    
                    try eventStore.save(event, span: .thisEvent)
                    addCalendar = true
                    
                }catch _ as NSError{
                    
                    print("Error")
                    
                }
                
                
                print("Save event")
                
                
            }else{
                
                print("Error")
                
            }

        }
        
        return addCalendar
  
    }
 
    
}
