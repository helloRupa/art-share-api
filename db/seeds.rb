# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  # Clear all tables and reset id value
  [User, Artwork, ArtworkShare, Comment].each do |c|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{c.table_name} RESTART IDENTITY;")
  end

  users = %w[Bojangles Frodo Pickles]
  # Create Users (username)
  users.each { |u_name| User.create(username: u_name) }

  # Create Artworks (title, image_url, artist_id)
  users.each_with_index do |name, idx|
    Artwork.create(title: "#{name} Made This", image_url: "#{name}.com", artist_id: idx + 1)
  end

  # Create ArtworkShares (artwork_id, viewer_id)
  ArtworkShare.create(artwork_id: 1, viewer_id: 2)
  ArtworkShare.create(artwork_id: 1, viewer_id: 3)
  ArtworkShare.create(artwork_id: 2, viewer_id: 3)
  ArtworkShare.create(artwork_id: 3, viewer_id: 1)

  # Create Comments (artwork_id, user_id, body)
  Comment.create(artwork_id: 1, user_id: 2, body: 'Comment on art 1 by user 2')
  Comment.create(artwork_id: 1, user_id: 3, body: 'Comment on art 1 by user 3')
  Comment.create(artwork_id: 2, user_id: 1, body: 'Comment on art 2 by user 1')
end
