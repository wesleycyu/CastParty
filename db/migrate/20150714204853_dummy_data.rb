class DummyData < ActiveRecord::Migration
  def change
    User.create({name: "Wesley", email: "wesley.ch.yu@gmail.com", bio: "I listen to music while I code. These are jams that I like."})
    User.create({name: "Emily", email: "emrcraig@gmail.com", bio: "I use my husband's Spotify account to listen to music"})
    Song.create ({user_id: 1, title:"Boardwalks", artist:"Little May (Sonny Alven Remix)", url:"https://soundcloud.com/sonnyalven/little-may-boardwalks-sonny-alven-remix-1"})
    Song.create ({user_id: 1, title:"Welcome to Paradise", artist:"CS & Miskeyz (ft. Emma Carn)", url:"https://soundcloud.com/christianschultz/cs-miskeyz-welcome-to-paradise-ft-emma-carn"})
    Song.create ({user_id: 2, title:"No Scrubs", artist:"Bastille (Freddy Verano Edit)", url:"https://soundcloud.com/freddyverano/bastille-no-scrubs-freddy"})
  end
end
