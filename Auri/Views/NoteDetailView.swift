import SwiftUI
struct NoteDetailView: View {
  @ObservedObject var viewModel: NotesViewModel
  @State  var note: Note
  @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            TextField("Title", text: $note.title, )
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.system(size: 29))
            .font(.headline)
            
            TextEditor(text: $note.content)
                .padding()
            Spacer()
            Button(action: {
                viewModel.updateNote(note)
                dismiss()
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .random(in: 100...300))
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding()
            }
        }
        .navigationTitle("Edit")
        
    }
}
#Preview {
    ListNoteView()
}
