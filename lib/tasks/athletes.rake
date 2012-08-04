require 'open-uri'

desc 'add athlete data'
task :athletes => :environment do
  Athlete.destroy_all

  Dir.glob("/Users/jamesshipton/Dropbox/learn/athlete_data/*.xml") do |filename|
    doc = Nokogiri::XML(File.open(filename))

    doc.xpath('//athlete').each do |athlete|
      puts "Adding #{athlete.xpath('name').text}"

      guid          = athlete.xpath('id').text
      name          = athlete.xpath('name').text
      date_of_birth = athlete.xpath('date_of_birth').text
      country_name  = athlete.xpath('country_url_name').text

      medal_doc = Nokogiri::XML(open("http://open.live.bbc.co.uk/olympicdata/public/medallists/athletes/#{guid}"))

      if medal_doc.xpath('//athlete/m').text.present?
        gold = medal_doc.xpath('//athlete/m/@g').text
        silver = medal_doc.xpath('//athlete/m/@s').text
        bronze = medal_doc.xpath('//athlete/m/@b').text

        puts "medals = #{medal_doc.xpath('//athlete/m').text}"
      end

      Athlete.create!(
        guid: guid,
        name: name,
        date_of_birth: date_of_birth,
        country_name: country_name,
        gold: gold,
        silver: silver,
        bronze: bronze )
    end
  end
end