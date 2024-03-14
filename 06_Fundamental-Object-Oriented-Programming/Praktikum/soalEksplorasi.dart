class Book {
  int id;
  String title;
  String publisher;
  double price;
  String category;

  Book(this.id, this.title, this.publisher, this.price, this.category);
}

class BookStore {
  List<Book> books = [];

  // Menambahkan data buku
  void addBook(Book book) {
    books.add(book);
    print("Buku '${book.title}' telah ditambahkan.");
  }

  // Mendapatkan semua data buku
  List<Book> getAllBooks() {
    return books;
  }

  // Menghapus data buku berdasarkan ID
  void removeBook(int id) {
    Book? bookToRemove;
    for (var book in books) {
      if (book.id == id) {
        bookToRemove = book;
        break;
      }
    }

    if (bookToRemove != null) {
      books.remove(bookToRemove);
      print("\n Buku '${bookToRemove.title}' telah dihapus.");
    } else {
      print("\n Buku dengan ID '$id' tidak ditemukan.");
    }
  }
}

void main() {
  // Membuat objek toko buku
  var bookStore = BookStore();

  // Menambahkan beberapa data buku
  var book1 = Book(1, "Pemrograman Dart", "Katan", 150000, "Programming");
  var book2 = Book(2, "Belajar Flutter", "Hashby", 200000, "Mobile Development");

  bookStore.addBook(book1);
  bookStore.addBook(book2);

  // Mendapatkan semua data buku dan mencetaknya
  var allBooks = bookStore.getAllBooks();
  print("\n Daftar Buku:");
  for (var book in allBooks) {
    print("- ID: ${book.id}, Judul: ${book.title}, Penerbit: ${book.publisher}, Harga: ${book.price}, Kategori: ${book.category}");
  }

  // Menghapus salah satu buku berdasarkan ID
  bookStore.removeBook(2);

  // Mendapatkan kembali semua data buku dan mencetaknya setelah buku dihapus
  allBooks = bookStore.getAllBooks();
  print("\nDaftar Buku Setelah Penghapusan:");
  for (var book in allBooks) {
    print("- ID: ${book.id}, Judul: ${book.title}, Penerbit: ${book.publisher}, Harga: ${book.price}, Kategori: ${book.category}");
  }
}
