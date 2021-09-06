52: def add_artist
=> 53:  binding.pry
   54:     if session[:user_id]
   55:     @user = User.find(session[:user_id])
   56:     @artist = Artist.find(params[:id])
   57:    @added_artist = UserArtist.create(to_hash)
   58:    @user.added_artists << @added_artist
   59:    @added_artist.save
   60:     redirect_to admin_user_path
   61:     else
   62:  redirect_to admin_user_path
   63: end
   64: end

[1] pry(#<ArtistsController>)> @added_artist
=> nil
[2] pry(#<ArtistsController>)>  @user = User.find(session[:user_id])
[2] pry(#<ArtistsController>)> @user = User.find(session[:user_id])
@artist = Artist.find(params[:id])te(to_hash)
 User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 7], ["LIMIT", 1]]
 ↳ (pry):2:in `add_artist'
 Artist Load (0.1ms)  SELECT "artists".* FROM "artists" WHERE "artists"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
 ↳ (pry):3:in `add_artist'
 CACHE Artist Load (0.0ms)  SELECT "artists".* FROM "artists" WHERE "artists"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
 ↳ app/controllers/artists_controller.rb:82:in `to_hash'
=> #<UserArtist:0x00007fad6cd12290
id: 3,
user_id: nil,
artist_id: nil,
created_at: Thu, 17 Jun 2021 21:17:49.170517000 UTC +00:00,
updated_at: Mon, 05 Jul 2021 08:34:22.473196000 UTC +00:00,
name: "supremeink",
rating: nil,
email: nil>
[3] pry(#<ArtistsController>)> @added_artist  
=> #<UserArtist:0x00007fad6cd12290
id: 3,
user_id: nil,
artist_id: nil,
created_at: Thu, 17 Jun 2021 21:17:49.170517000 UTC +00:00,
updated_at: Mon, 05 Jul 2021 08:34:22.473196000 UTC +00:00,
name: "supremeink",
rating: nil,
email: nil>
[4] pry(#<ArtistsController>)> @user.added_artists  << @added_artist
ActiveRecord::AssociationTypeMismatch: Artist(#70191460662540) expected, got #<UserArtist id: 3, user_id: nil, artist_id: nil, created_at: "2021-06-17 21:17:49.170517000 +0000", updated_at: "2021-07-05 08:34:22.473196000 +0000", name: "supremeink", rating: nil, email: nil> which is an instance of UserArtist(#70191423508120)
from /Users/jasondavis/.rvm/gems/ruby-2.6.1/gems/activerecord-6.1.4/lib/active_record/associations/association.rb:283:in `raise_on_type_mismatch!'
[5] pry(#<ArtistsController>)> def to_hash
       @artist = Artist.find(params[:id])
       @artist.attributes.reject! do |key, value| 
        key == "password_digest" || key == "bio" || key == "artist_id"
[5] pry(#<ArtistsController>)> def to_hash
 @artist = Artist.find(params[:id])e}
 @artist.attributes.reject! do |key, value| 
   key == "password_digest" || key == "bio" || key == "artist_id"
   @added_artist = {}
   @added_artist << {:key,:value}
SyntaxError: unexpected ',', expecting =>
   @added_artist << {:key,:value}
                         ^
[5] pry(#<ArtistsController>)>   def to_hash
       @artist = Artist.find(params[:id])
       @artist.attributes.reject! do |key, value| 
        key == "password_digest" || key == "bio" || key == "artist_id"
[5] pry(#<ArtistsController>)> def to_hash
 @artist = Artist.find(params[:id])lue}"
 @artist.attributes.reject! do |key, value| 
   key == "password_digest" || key == "bio" || key == "artist_id"
   @added_artist = {}
   @added_artist << "${:key,:value}"
[5] pry(#<ArtistsController>)* end  
=> :to_hash
[6] pry(#<ArtistsController>)> @added_artist
=> #<UserArtist:0x00007fad6cd12290
id: 3,
user_id: nil,
artist_id: nil,
created_at: Thu, 17 Jun 2021 21:17:49.170517000 UTC +00:00,
updated_at: Mon, 05 Jul 2021 08:34:22.473196000 UTC +00:00,
name: "supremeink",
rating: nil,
email: nil>
[7] pry(#<ArtistsController>)> to_hash
 CACHE Artist Load (0.0ms)  SELECT "artists".* FROM "artists" WHERE "artists"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
 ↳ (pry):8:in `to_hash'
NoMethodError: undefined method `<<' for {}:Hash
Did you mean?  <
from (pry):12:in `block in to_hash'
[8] pry(#<ArtistsController>)> def to_hash
       @artist = Artist.find(params[:id])
       @artist.attributes.reject! do |key, value| 
        key == "password_digest" || key == "bio" || key == "artist_id"
[8] pry(#<ArtistsController>)> def to_hash
 @artist = Artist.find(params[:id])ue}"
 @artist.attributes.reject! do |key, value| 
   key == "password_digest" || key == "bio" || key == "artist_id"
   @added_artist 
   @added_artist = "${:key,:value}"
[8] pry(#<ArtistsController>)* end  
=> :to_hash
[9] pry(#<ArtistsController>)> to_hash
 CACHE Artist Load (0.0ms)  SELECT "artists".* FROM "artists" WHERE "artists"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
 ↳ (pry):18:in `to_hash'
=> {}
[10] pry(#<ArtistsController>)> def to_hash
       @artist = Artist.find(params[:id])
       @artist.attributes.reject! do |key, value| 
        key == "password_digest" || key == "bio" || key == "artist_id"
[10] pry(#<ArtistsController>)> def to_hash
 @artist = Artist.find(params[:id])}"
 @artist.attributes.reject! do |key, value| 
   key == "password_digest" || key == "bio" || key == "artist_id"
   @added_artist 
   @added_artist = "${key,value}"
[10] pry(#<ArtistsController>)* end  
=> :to_hash
[11] pry(#<ArtistsController>)> to_hash
 CACHE Artist Load (0.0ms)  SELECT "artists".* FROM "artists" WHERE "artists"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
 ↳ (pry):27:in `to_hash'
=> {}
[12] pry(#<ArtistsController>)> @added_artist = UserArtist.create(to_hash)
 CACHE Artist Load (0.0ms)  SELECT "artists".* FROM "artists" WHERE "artists"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
 ↳ (pry):27:in `to_hash'
=> #<UserArtist:0x00007fad6fdc6e40
id: nil,
user_id: nil,
artist_id: nil,
created_at: nil,
updated_at: nil,
name: nil,
rating: nil,
email: nil>
[13] pry(#<ArtistsController>)>  def to_hash
       @artist = Artist.find(params[:id])
       @artist.attributes.reject! do |key, value| 
[13] pry(#<ArtistsController>)> def to_hasht" || key == "bio" || key == "artist_id"
 @artist = Artist.find(params[:id])
 @artist.attributes.reject! do |key, value| 
   @added_artist = key == "password_digest" || key == "bio" || key == "artist_id"
 end  
end
=> :to_hash         
[14] pry(#<ArtistsController>)> to_hash
 CACHE Artist Load (0.0ms)  SELECT "artists".* FROM "artists" WHERE "artists"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
 ↳ (pry):37:in `to_hash'
=> {"id"=>3,
"name"=>"supremeink",
"rating"=>nil,
"email"=>nil,
"created_at"=>Thu, 17 Jun 2021 21:17:49.170517000 UTC +00:00,
"updated_at"=>Mon, 05 Jul 2021 08:34:22.473196000 UTC +00:00}
[15] pry(#<ArtistsController>)> @added_artist = UserArtist.create(to_hash)
 CACHE Artist Load (0.0ms)  SELECT "artists".* FROM "artists" WHERE "artists"."id" = ? LIMIT ?  [["id", 3], ["LIMIT", 1]]
 ↳ (pry):37:in `to_hash'
=> #<UserArtist:0x00007fad69ccd2b0
id: 3,
user_id: nil,
artist_id: nil,
created_at: Thu, 17 Jun 2021 21:17:49.170517000 UTC +00:00,
updated_at: Mon, 05 Jul 2021 08:34:22.473196000 UTC +00:00,
name: "supremeink",
rating: nil,
email: nil>
[16] pry(#<ArtistsController>)> @added_artist
=> #<UserArtist:0x00007fad69ccd2b0
id: 3,
user_id: nil,
artist_id: nil,
created_at: Thu, 17 Jun 2021 21:17:49.170517000 UTC +00:00,
updated_at: Mon, 05 Jul 2021 08:34:22.473196000 UTC +00:00,
name: "supremeink",
rating: nil,
email: nil>
[17] pry(#<ArtistsController>)> @user.user_artists << @added_artist
=> nil
[18] pry(#<ArtistsController>)> @user.user_artists
 UserArtist Load (0.2ms)  SELECT "user_artists".* FROM "user_artists" WHERE "user_artists"."user_id" = ?  [["user_id", 7]]
 ↳ app/controllers/artists_controller.rb:53:in `add_artist'
=> [#<UserArtist:0x00007fad69ccd2b0
 id: 3,
 user_id: 7,
 artist_id: nil,
 created_at: Thu, 17 Jun 2021 21:17:49.170517000 UTC +00:00,
 updated_at: Mon, 05 Jul 2021 08:34:22.473196000 UTC +00:00,
 name: "supremeink",
 rating: nil,
 email: nil>]
[19] pry(#<ArtistsController>)> @user.user_artists.count
  (0.2ms)  SELECT COUNT(*) FROM "user_artists" WHERE "user_artists"."user_id" = ?  [["user_id", 7]]
 ↳ (pry):47:in `add_artist'
=> 0
[20] pry(#<ArtistsController>)> @user.user_artists << @artist
ActiveRecord::AssociationTypeMismatch: UserArtist(#70191423508120) expected, got #<Artist id: 3, name: "supremeink", rating: nil, email: nil, password_digest: [FILTERED], created_at: "2021-06-17 21:17:49.170517000 +0000", updated_at: "2021-07-05 08:34:22.473196000 +0000", bio: "Former Art Teacher. Specialty is vector illustrati...", artist_id: 3> which is an instance of Artist(#70191460662540)
from /Users/jasondavis/.rvm/gems/ruby-2.6.1/gems/activerecord-6.1.4/lib/active_record/associations/association.rb:283:in `raise_on_type_mismatch!'
[21] pry(#<ArtistsController>)>