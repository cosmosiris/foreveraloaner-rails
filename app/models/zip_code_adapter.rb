module ZipCodeAdapter

include HTTParty

base_uri "zipcodeapi.com/rest"

  def self.zip_search(zip_code, distance)
    res = self.get("/#{ENV['ZIP_API_TOKEN']}/radius.json/#{zip_code}/#{distance}/mile")
    return nil if res.parsed_response['zip_codes'].nil?
    zips = res.parsed_response['zip_codes'].map do |zip|
      zip['zip_code']
    end
    zips
  end
end
