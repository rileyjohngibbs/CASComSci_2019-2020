//
//  ScheduleItem.swift
//  ScheduleSaver
//
//  Created by Riley Gibbs on 1/10/20.
//  Copyright © 2020 Riley Gibbs. All rights reserved.
//

import Foundation

class ScheduleItem: Codable {
    init(period: String, course: String, room: String, teacher: String) {
        self.period = period
        self.course = course
        self.room = room
        self.teacher = teacher
    }
    var period: String
    var course: String
    var room: String
    var teacher: String
}
