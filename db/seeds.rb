def yelp_call(theater)
  search_theater = theater.gsub(" ", "+")

  consumer_key = YELP_CONSUMER_KEY
  consumer_secret = "#{YELP_CONSUMER_SECRET}"
  token = "#{YELP_TOKEN}"
  token_secret = "#{YELP_TOKEN_SECRET}"

  api_host = 'api.yelp.com'

  consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
  access_token = OAuth::AccessToken.new(consumer, token, token_secret)

  path = "/v2/search?term=#{search_theater}+theater+performing+arts&location=new+york"
  
  yelp_search = access_token.get(path).body

  yelp = JSON(yelp_search)
  return create_venue(yelp)
end

def create_venue(yelp)
  return Venue.create(
    name: yelp["businesses"][0]["name"],
    display_address: yelp["businesses"][0]["location"]["display_address"].join("\n"),
    cross_streets: yelp["businesses"][0]["location"]["cross_streets"],
    address: yelp["businesses"][0]["location"]["address"].first,
    city: yelp["businesses"][0]["location"]["city"],
    state_code: yelp["businesses"][0]["location"]["state_code"],
    postal_code: yelp["businesses"][0]["location"]["postal_code"],
    image_url: yelp["businesses"][0]["image_url"],
    url: yelp["businesses"][0]["url"],
    rating_image_url: yelp["businesses"][0]["rating_img_url"],
    yelp_id: yelp["businesses"][0]["id"],
    review_count: yelp["businesses"][0]["review_count"]
    ) 
end

joyce = yelp_call("Joyce Theater")
ailey = yelp_call("Alvin Ailey American Dance Theater")
ps122 = yelp_call("PS 122")
lincoln_center = yelp_call("Lincoln Center")
nyla = yelp_call("NYLA")

venues = [joyce, ailey, ps122, lincoln_center, nyla]
names = ["Manhattan Dance Company", "Queens Dance Group", "Brooklyn Dance Collective", "Bronx Dances", "Staten Island Dance Arts"]
photos = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdWPgFQycWBCgH9ENTu18Dig5NtU5CwkM1ZoJmf1PCtMzdLll8","http://nyoobserver.files.wordpress.com/2011/11/7-train.jpg", "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSTP3_fmBHzZqiFuM0DS5taoh2Lyd4cZuHKljaWxVoiTbq_0uAe", "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTDg-J217P0xXTXGJ_4CqsIQ-hpxsETrp-IncG8ZqDmnsvgHBejPw", "http://thumbs.dreamstime.com/z/staten-island-ferry-new-york-20257332.jpg"]

# CREATE 5 companies
# =========================================

[0,1,2,3,4].each do |num|
  company = FactoryGirl.create(:company)
  company.name = names[num]
  company.photo_url = photos[num]
  user = company.admin
  user.companies << company
  company.save
end

# CREATE 3 RUNS PER COMPANY
# ======================================

Company.all.each do |co|
  r_w = FactoryGirl.create(:recent_week_run)
  r_m = FactoryGirl.create(:recent_month_run)
  u_w = FactoryGirl.create(:upcoming_week_run)
  u_m = FactoryGirl.create(:upcoming_month_run)

  r_w.company = co
  r_m.company = co
  u_w.company = co
  u_m.company = co

  co.runs << r_w
  co.runs << r_m
  co.runs << u_w
  co.runs << u_m

  r_w.venue = venues.sample
  r_m.venue = venues.sample
  u_w.venue = venues.sample
  u_m.venue = venues.sample

  r_w.save
  r_m.save
  u_w.save
  u_m.save
end

# CREATE 3 REVIEWS PER USER PER RUN
# ======================================


Run.all.each do |run|
  if run.performances.order('date').first.date <= Time.now
    User.destroy_all("id > '5'")
    User.all.each do |user|
      perf = run.performances.sample
      review = FactoryGirl.create(:review)
      review.user = user
      user.reviews << review
      perf.reviews << review
      review.save
    end
  end
end

Company.destroy_all("id > '5'")
Venue.destroy_all("id > '5'")
Run.destroy_all("id > '20'")
User.destroy_all("id > '5'")



# ==============================================
# Add ReviewVotes
users = User.where('id > 1' && 'id < 6')

users.each do |user|
  Performance.all.each do |perf|
    reviews = Review.where("performance_id = #{perf.id}" && "user_id != #{user.id}")
    reviews.each do |review|
      value = [1, -1].sample
      ReviewVote.create(
        user_id: user.id,
        review_id: review.id,
        value: value
        )
    end
  end
end

Review.all.each do |review|
  review.vote_total = review.compute_vote_total
  review.save
end
# ==============================================



# END OF FAKE SEED DATA

# ==============================================
# ==============================================



Create a DanceShare admin

danceshare_user = User.create(
  first_name: "DanceShare",
  last_name: "NYC",
  email: "ds@ex.com",
  password: "password",
  password_confirmation: "password"
)

Video.create(
  author: "Francisco Graciano",
  title: "Owning Your Flaws as a Performer",
  category: "Performance",
  sub_category: "Elements of Performance",
  video_id: "4XMAx83j-fs",
  user: danceshare_user,
  description: "Francisco Graciano of Paul Taylor Dance Company talks about dealing with one's inner flaws and problems as a performer.  He discusses accepting flaws versus hiding them and how this affects one's performance."
)

Video.create(
  author: "Jennifer Goggans",
  title: 'The Value of "Just Do It" in Dance',
  category: "Training",
  sub_category: "Class/Rehearsal",
  video_id: "BCgNfJD5OBU",
  user: danceshare_user,
  description: "Jennifer Goggans, former member of Merce Cunningham Dance Company, shares the philosophy she adopted of one of her past teachers when it comes to dancing- \"just do it.\"  One can analyze and think about dance a lot, but the physical act of dancing is what's most important.  She shares how Merce Cunningham also seemed to share this philosophy."
)

Video.create(
  author: "Daniel Madoff",
  title: 'How to Enhance the Sense of Opposition in Arabesque',
  category: "Technique",
  sub_category: "Arabesque",
  video_id: "RQHbUqZ7F6k",
  user: danceshare_user,
  description: "Daniel Madoff, former member of Merce Cunningham Dance Company, discusses an idea for arabesque he got from ballet teacher Janet Panetta which is to find opposition between the back leg and same side of the back."
)

Video.create(
  author: "Emma Desjardins",
  title: 'What Makes an Interesting Dancer?',
  category: "Performance",
  sub_category: "What Makes an Interesting Dancer",
  video_id: "8oOi-AH00Z4",
  user: danceshare_user,
  description: "Emma Desjardins, former member of Merce Cunningham Dance Company, discusses what she thinks makes dancers in performance interesting to watch."
)

Video.create(
  author: "Chelsea Lynn Acree",
  title: 'Imagery to Make Rotation a Movement',
  category: "Technique",
  sub_category: "External Rotation",
  video_id: "-7haGvQ8bio",
  user: danceshare_user,
  description: "Chelsea Lynn Acree of Mark Morris Dance Group shares an image she uses in her teaching that helps make external rotation a movement rather than a position."
)

Video.create(
  author: "Robert Swinston",
  title: 'How to Use Opposition in Lunges and Triplets',
  category: "Technique",
  sub_category: "Movement Quality/ Principles",
  video_id: "m2IKZFx2eoo",
  user: danceshare_user,
  description: "Robert Swinston, former member of Merce Cunningham Dance Company, talks about the usefulness of being active with the back leg in lunges and triplets and how this opposition gives clarity to the movements."
)

# Video.create(
#   author: "",
#   title: '',
#   category: "",
#   sub_category: "",
#   video_id: "",
#   user: danceshare_user,
#   description: ""
# )


















# DUMMY REVIEWS


# Review.create(
#   title: "From Another World",
#   review_text: "I loved the feel of the design elements!",
#   rating: "4",
#   created_at: "2014-02-02",
#   updated_at: "2014-02-02",
#   user_id: hal.id,
#   performance_id: kara_p1.id
#   )

# Review.create(
#   title: "Refreshing a Memory",
#   review_text: "This peformance felt like a continuation of the company's last piece. I enjoyed seeing that development!",
#   rating: "5",
#   created_at: "2014-02-03",
#   updated_at: "2014-02-03",
#   user_id: tim.id,
#   performance_id: kara_p1.id
#   )

# Review.create(
#   title: "Didn't Connect",
#   review_text: "I just couldn't connect with the piece. It started very slowly, and the parts never came together for me.",
#   rating: "2",
#   created_at: "2014-02-18",
#   updated_at: "2014-02-18",
#   user_id: hal.id,
#   performance_id: kara_p2.id
#   )

# Review.create(
#   title: "Getting There...",
#   review_text: "I think I see where they were trying to go with this, but it felt like an unfinished idea. And why was the witch involved so much? The character felt so powerful at the beginning, but it lost that due to overuse IMHO. :)",
#   rating: "3",
#   created_at: "2014-02-19",
#   updated_at: "2014-02-19",
#   user_id: tim.id,
#   performance_id: kara_p2.id
#   )

# Review.create(
#   title: "Very Cryptic",
#   review_text: "It's been three days since the performance, and I'm still figuring it out. I can't put words to my thoughts, but I just realized how much I love that! A dance that can provide deep thought for three days is a gem in my book!",
#   rating: "5",
#   created_at: "2014-02-05",
#   updated_at: "2014-02-05",
#   user_id: kara.id,
#   performance_id: tim1_p1.id
#   )

# Review.create(
#   title: "What...Was...That!?",
#   review_text: "Complete gibberish. I had no clue what was going on.",
#   rating: "2",
#   created_at: "2014-02-03",
#   updated_at: "2014-02-03",
#   user_id: hal.id,
#   performance_id: tim1_p1.id
#   )

# Review.create(
#   title: "Impressive!",
#   review_text: "This is a company of acrobat-dancers. The choreographer did a great job of generating material that showed off the individual dancers' strengths. So interesting to see each of the performers' uniquenesses.",
#   rating: "3",
#   created_at: "2014-02-19",
#   updated_at: "2014-02-19",
#   user_id: kara.id,
#   performance_id: tim1_p2.id
#   )

# Review.create(
#   title: "A Challenge of Endurance",
#   review_text: "The piece was forty minutes long with the same techno-beat going the whole time. I felt frustrated that it went on so long. I enjoyed the first twenty minutes, but I felt the second half didn't elaborate or develop at all.",
#   rating: "3",
#   created_at: "2014-02-02",
#   updated_at: "2014-02-02",
#   user_id: kara.id,
#   performance_id: tim2_p1.id
#   )

# Review.create(
#   title: "The Music Ruined It",
#   review_text: "I enjoyed the exquisite lines of the dancers, but the music was waaaay too loud and gave me a headache. I seriously wanted to walk out.",
#   rating: "3",
#   created_at: "2014-02-15",
#   updated_at: "2014-02-15",
#   user_id: hal.id,
#   performance_id: tim2_p2.id
#   )

# Review.create(
#   title: "Visceral",
#   review_text: "How intense! The dancers were going non-stop. I don't know how they lasted. The intensity of the music matched this chaos. It was so loud that my seat was vibrating, and I could feel it in my bones. What an intense, riveting combination of visual and aural complexity!",
#   rating: "3",
#   created_at: "2014-02-18",
#   updated_at: "2014-02-18",
#   user_id: kara.id,
#   performance_id: tim2_p2.id
#   )











