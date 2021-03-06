
class Shortener

  attr_reader :url, :link_model

  def initialize(url, link_model: Link)
    @url = url
    @link_model = link_model
  end

  def generate_short_link
    link_model.create(original_url: url, lookup_code: lookup_code)
  end


  def lookup_code
      # 1. Get loop up code
      # 2. Check if it already exits
      # 3. If it does not exit get out of lookup and return code
      # 4. Otherwise get another code and loop again

    loop do
      code = get_fresh_code
      break code unless link_model.exists?(lookup_code: code)
    end
  end

  private

  def get_fresh_code
    SecureRandom.uuid[0..6]
  end

end
