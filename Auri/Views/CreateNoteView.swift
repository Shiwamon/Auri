import SwiftUI
struct CreateNoteView: View {
    @ObservedObject var viewModel: NotesViewModel
        @Environment(\.dismiss) var dismiss
        
        @State private var text: String = ""
    var body: some View {
        VStack {
                    
                    TextEditor(text: $text)
                        .padding()
                        .onChange(of: text) { _ in
                            // noÍthing to do manually, text will be split on save
                        }
                    
                    Spacer()
                    
                    Button(action: saveNote) {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding()
                }
        .navigationTitle("Create")
        .navigationBarTitleDisplayMode(.inline)


            }
    func saveNote() {
            // Якщо текст пустий — не зберігаємо
            let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
            guard trimmed.isEmpty == false else {
                dismiss()
                return
            }
            
            // Отримуємо рядки
            let lines = trimmed.components(separatedBy: .newlines)
            
            let title = lines.first ?? "Untitled"
            let content = lines.dropFirst().joined(separator: "\n")
            
            let newNote = Note(title: title, content: content)
            
            viewModel.addNote(newNote)
            dismiss()
        }
    }
#Preview {
    ListNoteView()
}



