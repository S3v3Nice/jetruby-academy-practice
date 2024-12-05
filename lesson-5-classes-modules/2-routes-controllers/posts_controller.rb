# frozen_string_literal: true

require_relative 'resource'

class PostsController
  extend Resource

  def initialize
    @posts = {}
    @next_id = 1
  end

  def index
    @posts.each_key do |id|
      print_post id
    end
  end

  def show
    print 'Post ID: '
    id = gets.chomp.to_i

    post = @posts[id]
    if post.nil?
      puts "Post with id #{id} is not found!"
      return
    end

    print_post id
  end

  def create
    print 'Post content: '
    post = gets.chomp

    id = @next_id
    @posts[id] = post
    @next_id += 1

    print_post id
  end

  def update
    print 'Post ID: '
    id = gets.chomp.to_i

    unless @posts.key? id
      puts "Post with id #{id} is not found!"
      return
    end

    print 'New post content: '
    post = gets.chomp
    @posts[id] = post

    print_post id
  end

  def destroy
    print 'Post ID: '
    id = gets.chomp.to_i

    unless @posts.key? id
      puts "Post with id #{id} is not found!"
      return
    end

    @posts.delete id
  end

  private

  def print_post(id)
    puts "#{id}. #{@posts[id]}"
  end
end
