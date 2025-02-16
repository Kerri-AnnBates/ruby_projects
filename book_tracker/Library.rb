class Library
  #  Define library
  #  books - a collection of books

  attr_accessor :books

  def initialize
    @books = []
    @favorites = []
    @finished = []
  end

  def add_book(book)
    @books << book
  end

  def list_books
    @books.each do |book|
      puts book.summary
    end
  end

  def list_favorites
    @favorites = @books.select { |book| book.is_favorite? }
    return puts "No favorite books to list yet." if @favorites.empty?

    @favorites.each { |book| puts book.summary }
  end


  def list_finished
    @finished = @books.select { |book| book.is_finished? }
    return puts "No finished books to list yet." if @finished.empty?

    @finished.each { |book| puts book.summary }
  end

  def list_unread
    @books.select{|book| !book.is_finished? }
  end

  def search_book_title(title)
    results = @books.select do |book|
      book.title.downcase.include?(title.downcase)
    end

    return puts "No match found!" if results.empty?

    results.each { |book| puts book.summary }
  end

  def search_book_author(author)
    results = @books.select do |book|
      book.author.name.downcase.include?(author.downcase)
    end

    return puts "No match found!" if results.empty?

    results.each { |book| puts book.summary }
  end

  # Possible actions: List available books (paginate), search for a book by title or author, mark book as a favorite
  # mark book as "finished", list "finished" books, list un-read books
end