class BlipsController < ApplicationController

  respond_to :json

  def create
    @blip ||= Blip.new blip_params
    user = current_user
    user.blips << @blip
    @sentence = Sentence.find params[:sentence_id]
    @blip.sentence = @sentence

    # make this now output json:

    # {statistics: [
    #  {word: "butts", frequency: "95%"},
    #  {word: "dogs", frequency: "2%"},
    #  {word: "vegetables", frequency: "1%"},
    #  {word: "sun", frequency: "2%"}
    # ]}

   
    # Stats related vvvvv
    count = @sentence.blips.group(:body).distinct.count
    percent = count.each {|k, v| count[k] = v / @sentence.blips_count.to_f }
    statistics = percent.sort_by { |k, v| v }.reverse[0..4].flatten.each { |k, v| puts "#{k}: #{v}" }
    #{"sentences":[ ["nice",8],["moon",6],["food",6],["butts",6],["test",5] ]}
    #{stats: [{word: k frequency: v}]}
    #{"sentences":["test",0.27906976744186046,"nice",0.18604651162790697,"food",0.13953488372093023,"moon",0.13953488372093023,"butts",0.13953488372093023]}





    if @blip.save
      @blip.increment!(:count)
      render json: statistics
    else
      redirect_to root_path
    end
  end

  def destroy

  end

  def show

  end


  private

  def blip_params
     params.require(:blip).permit(:body, :sentence_id)
  end

  # def find_sentence
  #   @sentence = Sentence.find params[:id]
  # end

end
