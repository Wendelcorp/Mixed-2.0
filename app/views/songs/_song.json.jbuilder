json.extract! song, :id, :artist, :title, :link, :mix_id, :created_at, :updated_at
json.url song_url(song, format: :json)
