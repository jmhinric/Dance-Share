# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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



hal = User.new(
  first_name: "Hal",
  last_name: "Jordan",
  email: "hal@ex.com",
  password: "greenlantern",
  password_confirmation: "greenlantern",
  gender: "male",
  dob: "1976-01-01",
  photo_url: "http://static.comicvine.com/uploads/scale_small/6/66303/1673684-green_lantern_62.jpg",
  is_admin: false
  )
hal.save

kara = User.new(
  first_name: "Kara",
  last_name: "Kent",
  email: "kara@ex.com",
  password: "supergirl",
  password_confirmation: "supergirl",
  gender: "female",
  dob: "1985-07-01",
  photo_url: "http://static.comicvine.com/uploads/scale_small/0/4/34569-5263-38612-1-supergirl.jpg",
  is_admin: true
  )
kara.save

tim = User.new(
  first_name: "Tim",
  last_name: "Drake",
  email: "tim@ex.com",
  password: "robin",
  password_confirmation: "robin",
  gender: "male",
  dob: "1983-10-01",
  photo_url: "http://static.comicvine.com/uploads/scale_small/0/40/311801-4975-123392-1-robin.jpg",
  is_admin: true
  )
tim.save

kara_company = Company.create(
  name: "Kryptonians",
  photo_url: "http://static.comicvine.com/uploads/scale_small/1/15297/682277-new_krypton.jpg",
    user_id: kara.id
  )
kara.companies << kara_company

tim_company1 = Company.create(
  name: "Red Birds",
  photo_url: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ3Wd5GGJ-65EILHD12sgLVEF14dM4RawNY6IBDYH_8VUkdTpFDPg",
  user_id: tim.id
  )
tim.companies << tim_company1

tim_company2 = Company.create(
  name: "Renegades",
  photo_url: "http://www.tuvie.com/wp-content/uploads/suzuki-crosscage-hybrid-motorcycle-concept1.jpg",
  user_id: tim.id
  )
tim.companies << tim_company2

kara_p1 = Performance.create(
  title: kara_company.name,
  date: "2014-02-01",
  time: "20:00:00",
  company_id: kara_company.id,
  venue_id: joyce.id)
  kara_p1.pretty_date = kara_p1.date.strftime("%A, %B %e, %Y")
  kara_p1.pretty_time = kara_p1.time.strftime("%l:%M %p")
  kara_p1.save

kara_p2 = Performance.create(
  title: kara_company.name,
  date: "2014-02-17",
  time: "20:00:00",
  company_id: kara_company.id,
  venue_id: ailey.id)
  kara_p2.pretty_date = kara_p2.date.strftime("%A, %B %e, %Y")
  kara_p2.pretty_time = kara_p2.time.strftime("%l:%M %p")
  kara_p2.save

kara_p3 = Performance.create(
  title: kara_company.name,
  date: "2014-02-20",
  time: "20:00:00",
  company_id: kara_company.id,
  venue_id: ps122.id)
  kara_p3.pretty_date = kara_p3.date.strftime("%A, %B %e, %Y")
  kara_p3.pretty_time = kara_p3.time.strftime("%l:%M %p")
  kara_p3.save

kara_p4 = Performance.create(
  title: kara_company.name,
  date: "2014-04-01",
  time: "20:00:00",
  company_id: kara_company.id,
  venue_id: lincoln_center.id)
  kara_p4.pretty_date = kara_p4.date.strftime("%A, %B %e, %Y")
  kara_p4.pretty_time = kara_p4.time.strftime("%l:%M %p")
  kara_p4.save

tim1_p1 = Performance.create(
  title: tim_company1.name,
  date: "2014-02-02",
  time: "20:00:00",
  company_id: tim_company1.id,
  venue_id: joyce.id)
  tim1_p1.pretty_date = tim1_p1.date.strftime("%A, %B %e, %Y")
  tim1_p1.pretty_time = tim1_p1.time.strftime("%l:%M %p")
  tim1_p1.save

tim1_p2 = Performance.create(
  title: tim_company1.name,
  date: "2014-02-16",
  time: "20:00:00",
  company_id: tim_company1.id,
  venue_id: ailey.id)
  tim1_p2.pretty_date = tim1_p2.date.strftime("%A, %B %e, %Y")
  tim1_p2.pretty_time = tim1_p2.time.strftime("%l:%M %p")
  tim1_p2.save

tim1_p3 = Performance.create(
  title: tim_company1.name,
  date: "2014-02-21",
  time: "20:00:00",
  company_id: tim_company1.id,
  venue_id: ps122.id)
  tim1_p3.pretty_date = tim1_p3.date.strftime("%A, %B %e, %Y")
  tim1_p3.pretty_time = tim1_p3.time.strftime("%l:%M %p")
  tim1_p3.save

tim1_p4 = Performance.create(
  title: tim_company1.name,
  date: "2014-05-01",
  time: "20:00:00",
  company_id: tim_company1.id,
  venue_id: lincoln_center.id)
  tim1_p4.pretty_date = tim1_p4.date.strftime("%A, %B %e, %Y")
  tim1_p4.pretty_time = tim1_p4.time.strftime("%l:%M %p")
  tim1_p4.save


tim2_p1 = Performance.create(
  title: tim_company2.name,
  date: "2014-02-01",
  time: "20:00:00",
  company_id: tim_company2.id,
  venue_id: ailey.id)
  tim2_p1.pretty_date = tim2_p1.date.strftime("%A, %B %e, %Y")
  tim2_p1.pretty_time = tim2_p1.time.strftime("%l:%M %p")
  tim2_p1.save

tim2_p2 = Performance.create(
  title: tim_company2.name,
  date: "2014-02-15",
  time: "20:00:00",
  company_id: tim_company2.id,
  venue_id: ps122.id)
  tim2_p2.pretty_date = tim2_p2.date.strftime("%A, %B %e, %Y")
  tim2_p2.pretty_time = tim2_p2.time.strftime("%l:%M %p")
  tim2_p2.save

tim2_p3 = Performance.create(
  title: tim_company2.name,
  date: "2014-02-24",
  time: "20:00:00",
  company_id: tim_company2.id,
  venue_id: lincoln_center.id)
  tim2_p3.pretty_date = tim2_p3.date.strftime("%A, %B %e, %Y")
  tim2_p3.pretty_time = tim2_p3.time.strftime("%l:%M %p")
  tim2_p3.save

tim2_p4 = Performance.create(
  title: tim_company2.name,
  date: "2014-06-01",
  time: "20:00:00",
  company_id: tim_company2.id,
  venue_id: joyce.id)
  tim2_p4.pretty_date = tim2_p4.date.strftime("%A, %B %e, %Y")
  tim2_p4.pretty_time = tim2_p4.time.strftime("%l:%M %p")
  tim2_p4.save

Review.create(
  title: "From Another World",
  review_text: "I loved the feel of the design elements!",
  rating: "4",
  created_at: "2014-02-02",
  updated_at: "2014-02-02",
  user_id: hal.id,
  performance_id: kara_p1.id
  )

Review.create(
  title: "Refreshing a Memory",
  review_text: "This peformance felt like a continuation of the company's last piece. I enjoyed seeing that development!",
  rating: "5",
  created_at: "2014-02-03",
  updated_at: "2014-02-03",
  user_id: tim.id,
  performance_id: kara_p1.id
  )

Review.create(
  title: "Didn't Connect",
  review_text: "I just couldn't connect with the piece. It started very slowly, and the parts never came together for me.",
  rating: "2",
  created_at: "2014-02-18",
  updated_at: "2014-02-18",
  user_id: hal.id,
  performance_id: kara_p2.id
  )

Review.create(
  title: "Getting There...",
  review_text: "I think I see where they were trying to go with this, but it felt like an unfinished idea. And why was the witch involved so much? The character felt so powerful at the beginning, but it lost that due to overuse IMHO. :)",
  rating: "3",
  created_at: "2014-02-19",
  updated_at: "2014-02-19",
  user_id: tim.id,
  performance_id: kara_p2.id
  )

Review.create(
  title: "Very Cryptic",
  review_text: "It's been three days since the performance, and I'm still figuring it out. I can't put words to my thoughts, but I just realized how much I love that! A dance that can provide deep thought for three days is a gem in my book!",
  rating: "5",
  created_at: "2014-02-05",
  updated_at: "2014-02-05",
  user_id: kara.id,
  performance_id: tim1_p1.id
  )

Review.create(
  title: "What...Was...That!?",
  review_text: "Complete gibberish. I had no clue what was going on.",
  rating: "2",
  created_at: "2014-02-03",
  updated_at: "2014-02-03",
  user_id: hal.id,
  performance_id: tim1_p1.id
  )

Review.create(
  title: "Impressive!",
  review_text: "This is a company of acrobat-dancers. The choreographer did a great job of generating material that showed off the individual dancers' strengths. So interesting to see each of the performers' uniquenesses.",
  rating: "3",
  created_at: "2014-02-19",
  updated_at: "2014-02-19",
  user_id: kara.id,
  performance_id: tim1_p2.id
  )

Review.create(
  title: "A Challenge of Endurance",
  review_text: "The piece was forty minutes long with the same techno-beat going the whole time. I felt frustrated that it went on so long. I enjoyed the first twenty minutes, but I felt the second half didn't elaborate or develop at all.",
  rating: "3",
  created_at: "2014-02-02",
  updated_at: "2014-02-02",
  user_id: kara.id,
  performance_id: tim2_p1.id
  )

Review.create(
  title: "The Music Ruined It",
  review_text: "I enjoyed the exquisite lines of the dancers, but the music was waaaay too loud and gave me a headache. I seriously wanted to walk out.",
  rating: "3",
  created_at: "2014-02-15",
  updated_at: "2014-02-15",
  user_id: hal.id,
  performance_id: tim2_p2.id
  )

Review.create(
  title: "Visceral",
  review_text: "How intense! The dancers were going non-stop. I don't know how they lasted. The intensity of the music matched this chaos. It was so loud that my seat was vibrating, and I could feel it in my bones. What an intense, riveting combination of visual and aural complexity!",
  rating: "3",
  created_at: "2014-02-18",
  updated_at: "2014-02-18",
  user_id: kara.id,
  performance_id: tim2_p2.id
  )











