# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task["db:drop"].invoke
Rake::Task["db:create"].invoke
Rake::Task["db:migrate"].invoke


def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

def upload_fake_image
  uploader = ImageUploader.new(Sneaker.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end

def upload_fake_logos
  uploader = LogosUploader.new(Brand.new, :logos)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/logos', '*')).sample))
  uploader
end



Brand.create([
  {
    name: "Nike"
  }, {
    name: "Vans"
  }, {
    name: "Asics"
  }, {
    name: "Converse"
  }, {
    name: "Adidas"
  }, {
    name: "Jordan"
  }, {
    name: "Reebok"
  }, {
    name: "Ted Baker"
  }
])

def sneaker_price
  rand(1435..8900)
end

@Sneaker_sex = ["F", "M"]
@Sneaker_model = ["Huarache", "Gelss", "Stars"]

def create_sneaker
  Sneaker.create(
    image: upload_fake_image,
    brand_id: random_brand_id,
    price: sneaker_price,
    sex: @Sneaker_sex.sample,
    model: @Sneaker_model.sample
  )
end

10.times do
  create_sneaker
  puts 'Sneaker created'
end
