class Book
  # Define a book:
  # title - string
  # author - Author instance
  # pages - integer

  attr_accessor :title, :author, :pages

  def initialize(title, author, pages)
    @title = title
    @author = author
    @pages = pages
    @favorite = false
    @finished = false
  end

  def mark_as_favorite
    @favorite = true
  end

  def mark_as_finished
    @finished = true
  end

  def is_favorite?
    @favorite
  end

  def is_finished?
    @finished
  end

  def summary
    puts "#{@title} by #{@author.name} (#{@pages} pages)"
  end
end