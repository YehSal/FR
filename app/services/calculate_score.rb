class CalculateScore
  attr_accessor :char_params, :show_params, :user_params

  def initialize (char_params, show_params, user_params)
    @char_params = char_params
    @show_params = show_params
    @user_params = user_params
  end

  # calculate the character's score
  def calculate

    # @update = UpdateNews.new(@char_params)
    # if ((DateTime.now - 1.day).utc > (@user_params.media_update).utc)
    #   @poscount = @update.posupdate * 0.3
    #   @negcount = @update.negupdate * 0.3
    #   @user_params.media_update = DateTime.now
    # else
    #   @poscount = 0;
    #   @negcount = 0;
    # end
    # variables to keep the equation dry
    @episodes_ratio = char_params[:episodes]/show_params[:episodes]
    @pop_ratio = (0.2 * show_params[:popularity])
    @vote_ratio = (0.2 * show_params[:vote_average])
    @vote_count = show_params[:vote_count]
    @char_hash = char_params
    @show_hash = show_params
    @episodes_num = char_params[:episodes] * 0.5
    # binding.pry

    if @char_hash[:show] == "Keeping Up with the Kardashians"
      @char_hash[:score] = @episodes_ratio + @pop_ratio + @vote_ratio + @vote_count + @episodes_num
      # + @poscount - @negcount
    elsif @char_hash[:show] == "The Bachelorette"
      @char_hash[:score] = @episodes_ratio + @pop_ratio + @vote_ratio + @vote_count + @episodes_num
      #  + @poscount - @negcount
    else
      flash[:error] = "Show doesn't exist!"
    end
  end
end
