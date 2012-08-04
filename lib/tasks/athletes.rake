desc 'add athlete data'
task :athletes => :environment do
  Athlete.destroy_all

  Dir.glob("/Users/jamesshipton/Dropbox/learn/athlete_data/test.xml") do |filename|
    doc = Nokogiri::XML(File.open(filename))

    doc.xpath('//athlete').each do |athlete|
      guid          = athlete.xpath('id').text
      name          = athlete.xpath('name').text
      date_of_birth = athlete.xpath('date_of_birth').text
      country_name  = athlete.xpath('country_url_name').text

      Athlete.create!(guid: guid, name: name, date_of_birth: date_of_birth, country_name: country_name)
    end
  end
end