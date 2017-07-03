
#
@wikis.each do |wiki|
  json.set! wiki.id do
    json.extract wiki
  end
end
#
#
# json.extract! wiki, :id, :username, :name, :bio, :profile_pic_url
#
