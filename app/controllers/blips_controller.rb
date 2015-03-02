class BlipsController < ApplicationController

  respond_to :json

  def create
    @blip ||= Blip.new blip_params
    user = current_user
    user.blips << @blip
    @sentence = Sentence.find params[:sentence_id]
    @blip.sentence = @sentence

  




    if @blip.save
      @blip.increment!(:count)
      render json: nil, status: :ok
    else
      redirect_to root_path
    end
  end

  def destroy

  end

  def show
        @sentence = Sentence.find params[:sentence_id]

     count = @sentence.blips.group(:body).distinct.count
    percent = count.each {|k, v| count[k] = v / @sentence.blips_count.to_f }
    statistics = percent.sort_by { |k, v| v }.reverse[0..4].flatten.each { |k, v| puts "#{k}: #{v}" }
          render json: statistics

  end


  private

  def blip_params
     params.require(:blip).permit(:body, :sentence_id)
  end

  # def find_sentence
  #   @sentence = Sentence.find params[:id]
  # end

end
