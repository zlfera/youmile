class HomeController < ApplicationController
  def index
    # expires_in 12.hours
    fresh_when(etag: Time.new.day, public: true)
    # system("rails first")
    # respond_to do |format|
    # format.html
    # end
    #Spider2guwuJob.perform_later
  end

  def grain_index
    # system("rails first")
    @gg = Grain.all
    @gg = @gg.order(created_at: :desc)
  end

  def grain_home
    #where("variety ='中晚籼稻' or variety = '早籼稻'")
    # @variety = params[:variety]
    td_data = params[:td_data]
    if td_data == nil
      @redis = Grain.where("latest_price != '0'").where("latest_price != '拍卖'").order(created_at: :desc)
    else
      x, y = td_data.split(',')
      if y == 'address'
        x, _ = x.split('(')
      end
        @redis = Grain.where("#{y} = '#{x}'").where("latest_price != '0'").where("latest_price != '拍卖'").order(created_at: :desc)
    end
    #@redis = Redis.new(url: Rails.application.secrets.redis_url)
    #@redis.set('redis', g)
    #@redis = @redis.get('redis')
    #@redis = JSON.parse(@redis)
    #fresh_when(etag: Grain.all.size, public: true)
    #@redis = @redis.reverse
  end
end
