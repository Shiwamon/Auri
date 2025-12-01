import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    {
        didSet {
            saveNotes()
        }
    }
    private let notesKey = "savedNotes"
        
        init() {
            loadNotes()
        }
    
    func addNote(_ note: Note) {
        notes.append(note)
    }
    
    func removeNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    func updateNote(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        }
    }
    func saveNotes() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: "notes")
        }
    }
    func loadNotes() {
        if let data = UserDefaults.standard.data(forKey: "notes") {
            if let decoded = try? JSONDecoder().decode([Note].self, from: data) {
                notes = decoded
            }
        }
    }
}


