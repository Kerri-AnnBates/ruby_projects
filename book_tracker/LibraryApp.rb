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
    puts "1. Add a new book"
    puts "2. List all books"
    puts "3. List finished books"
    puts "4. List favorite books"
    puts "5. Mark book as favorite"
    puts "6. Mark book as finished"
    puts "7. Search for a book by title"
    puts "8. Search for a book by author"
    puts "9. Exit"
  end

  def handle_input(input)
    case input
    when 1
      add_book
    when 2
      list_books
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

  def list_books
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