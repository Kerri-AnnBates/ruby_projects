class LibraryApp
  def initialize
    @library = Library.new
  end

  def run
    loop do
      display_menu
      input = gets.chomp.to_i
      handle_input(input)
    end
  end

  private

  # Display menu options to the user
  def display_menu
    puts "\nChoose an option:"
    puts "1. List all books"
    puts "2. Add a new book"
    puts "3. List finished books"
    puts "4. List favorite books"
    puts "5. Mark book as favorite"
    puts "6. Mark book as finished"
    puts "7. Search for a book by title"
    puts "8. Search for a book by author"
    puts "9. Remove a book from library"
    puts "10. Exit"
  end

  def handle_input(input)
    case input
    when 1
      list_books
    when 2
      add_book
    when 3
      list_finished_books
    when 4
      list_favorite_books
    when 5
      mark_favorite
    when 6
      mark_finished
    when 7
      search_book_by_title
    when 8
      search_book_by_author
    when 9
      remove_book
    when 10
      puts "Goodbye!"
      exit
    else
      puts "Sorry, I don't understand that answer. Try again!"
    end
  end

  def add_book
    puts "Enter book title: "
    title = gets.chomp

    puts "Enter author name: "
    author = Author.new(gets.chomp)

    puts "Enter total number of pages: "
    pages = gets.chomp.to_i

    book = Book.new(title, author, pages)
    @library.add_book(book)
    puts "Book created successfully"
  end

  def remove_book
    puts "Enter book title: "
    title = gets.chomp

    book = @library.books.find { |book| book.title == title }
    removed = @library.remove_book(book)

    if removed != nil
      puts "Book deleted successfully"
    else
      puts "Book not deleted."
    end
  end

  def list_books
    if @library.books.empty?
      puts "There are no books in library!"
      return
    end

    puts "List of all books:"
    @library.list_books
  end

  def list_finished_books
    puts "List of finished books:"
    @library.list_finished
  end

  def list_favorite_books
    puts "List of favorite books:"
    @library.list_favorites
  end

  def mark_favorite
    return "No books in the library to choose from." if @library.books.empty?

    puts "Choose book to mark favorite: "
    @library.books.each_with_index { |book, i|
      puts "#{i + 1}. #{book.title}"
    }

    book = @library.books[gets.chomp.to_i - 1]
    book.mark_as_favorite
    puts "#{book.title} book marked as favorite!"
  end

  def mark_finished
    return "No books in the library to choose from." if @library.books.empty?
    puts "Choose book to mark finished: "
    @library.books.each_with_index do |book, i|
      puts "#{i + 1}. #{book.title}"
    end
    book = @library.books[gets.chomp.to_i - 1]
    book.mark_as_finished
  end

  def search_book_by_title
    puts "Enter book title: "
    title = gets.chomp
    @library.search_book_title(title)
  end

  def search_book_by_author
    puts "Enter book author: "
    author = gets.chomp
    @library.search_book_author(author)
  end
end