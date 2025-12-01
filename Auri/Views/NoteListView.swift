import SwiftUI

struct ListNoteView: View {
    @StateObject var viewModel = NotesViewModel()
    @State private var showNewNote = false
    @State private var newNote = Note(title: "", content: "")
    var body: some View {
        
      
        VStack {
            Text("Auri")
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .foregroundColor(.accentColor)
                .font(.system(size: 29))
                .font(.headline)
                .padding()
            
            
            NavigationView {
                List {
                    ForEach(viewModel.notes) { note in
                        NavigationLink(destination: NoteDetailView(viewModel: viewModel, note: note)) {
                            Text(note.title)
                        }
                    }
                    .onDelete(perform: viewModel.removeNote)
                }
            }
        }
        .onAppear{
             viewModel.loadNotes()
        }
        //AddButton
        .overlay( // кнопка плавающая
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                newNote = Note(title: "", content: "")
                                showNewNote = true
                            } label: {
                                Image(systemName: "plus")
                                    .padding(10)
                                    .font(.system(size: 27))
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                            }
                            .padding(.trailing, 15)
                            .padding(.bottom, 15)
                        }
                    }
                )
                    .padding()
                    .sheet(isPresented: $showNewNote) {
                        NavigationView {
                            CreateNoteView(viewModel: viewModel)
                        }
                }
            }
        }

#Preview {
    ListNoteView()
}


