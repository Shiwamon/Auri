import Foundation

enum NoteType: String, Codable {
    case text, voice, drawing
}

struct Note: Identifiable, Codable {
    var id = UUID()
    var title: String = ""
    var content: String = ""
    var date = Date()
    var type: NoteType = .text
}

