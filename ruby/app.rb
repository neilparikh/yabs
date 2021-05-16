# TODO: setup pagination
# TODO: Cross site scripting/sql injection
# TODO: verify that titles and tags only contain a-z and 0-9
# TODO: sanitize urls
require "sequel"
require "sinatra"

DB = Sequel.sqlite('bookmarks.db')

# TODO: this deletes the DB each time
# TODO: get create_at and updated_at working
#       look into timestamps plugin
DB.create_table! :bookmarks do
  primary_key :id
  String :title, null: false
  String :href, unique: true, null: false
  String :tags
end

class Bookmark < Sequel::Model
end

Bookmark.new(title: "Github", href: "https://github.com", tags: "a b c").save
Bookmark.new(title: "Google", href: "https://google.ca", tags: "d e f").save

set :bind, "0.0.0.0"

not_found do
  "404"
end

get '/' do
  bookmarks = Bookmark.all
  erb :bookmarks, { locals: { bookmarks: bookmarks } }
end

get '/bookmarks/new' do
  erb :new
end

post '/bookmarks/new' do
  bookmark = Bookmark.new
  bookmark.set_fields(params, [:title, :href, :tags])
  bookmark.save
  redirect "/bookmarks/#{bookmark.id}"
end

get '/bookmarks/:id' do
  bookmark = Bookmark[params[:id].to_i]
  return 404 unless bookmark
  erb :bookmark, { locals: { bookmark: bookmark } }
end

get '/bookmarks/:id/edit' do
  bookmark = Bookmark[params[:id].to_i]
  return 404 unless bookmark
  erb :edit, { locals: { bookmark: bookmark } }
end

post '/bookmarks/:id/edit' do
  bookmark = Bookmark[params[:id].to_i]
  return 404 unless bookmark
  bookmark.set_fields(params, [:title, :href, :tags])
  bookmark.save
  redirect "/bookmarks/#{params[:id]}"
end

delete '/bookmarks/:id' do
  bookmark = Bookmark[params[:id].to_i]
  return 404 unless bookmark
  bookmark.destroy
  redirect "/"
end

get '/tag/:tag' do
  bookmarks = Bookmark.where(Sequel.like(:tags, "%#{params[:tag]}%"))
  erb :bookmarks, { locals: { bookmarks: bookmarks } }
end
