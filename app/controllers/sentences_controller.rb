class SentencesController < ApplicationController

  before_action :find_sentence, only: [:show]



  respond_to :json, :js

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new sentence_params
    #@sentence.user = current_user
    if @sentence.save
      flash[:success] = "Sentence successfully created."
      redirect_to sentences_path
    else
      flash.now[:alert] = "Sentence was not created!"
      render :new
    end
  end

  def index
    if current_user
      @sentences = Sentence.all.order("created_at DESC") - current_user.sentences
      #@sentences = Sentence.include(:blips).all.order("created_at DESC") - current_user.sentences

    else
      @sentences = Sentence.all.order("created_at DESC")
    end
  end

  def show
    @sentence = Sentence.find(params[:id])
    count = @sentence.blips.group(:body).distinct.count
    percent = count.each {|k, v| count[k] = (v / (@sentence.blips_count.to_f / 2) * 100).round(2) }
    statistics = percent.sort_by { |k, v| v }.reverse[0..2].each { |k, v| puts "#{k}: #{v}" }
    render json: statistics



  end

  def stats
     @sentence = Sentence.find(params[:id])
    count = @sentence.blips.group(:body).distinct.count
    percent = count.each {|k, v| count[k] = (v / (@sentence.blips_count.to_f / 2) * 100).round(2) }
    @statistics = percent.sort_by { |k, v| v }.reverse[0..9].each { |k, v| puts "#{k}: #{v}" }

    final_output = []
    User.uniq.pluck(:country).each do |country|
      all_blips_for_country = []
      User.where(country: country).each do |user|
        user.blips.each do |blip|
          all_blips_for_country << blip
        end
      end

      output = Hash.new(0)
      all_blips_for_country.each do |blip|
        output[blip.body] += 1
      end
      final_set = output.sort_by{ |k,v| v }
      final_set.reverse!
      if final_set[0]
        tmp = final_set[0]
        final_output << [country, tmp[0]]
      end
    end

    @final_output = final_output
     # @new_map= new Chartkick.GeoChart("chart-1", [["United States",44],["Germany",23],["Brazil",22]]);

    #render json: @final_output
  end

  def destroy
    @sentence.destroy
    flash[:success] = "Sentence successfully deleted."
    redirect_to root_path
  end

  def edit

  end


  private

  def sentence_params
    params.require(:sentence).permit(:body, { tag_ids:[] })
  end

  def find_sentence
    @sentence = Sentence.find params[:id]
  end

end
