class SentencesController < ApplicationController

  before_action :find_sentence, only: [:show]



  respond_to :json

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
      @sentences = Sentence.all - current_user.sentences

    else
      @sentences = Sentence.all
    end

    #.blips.users.where(:user_id != current_user.id)
    # All Sentences where blip.users sentence_id is not present
  end

  def show
    #render json: @sentence.word_total(:id)
    #render json: Blip.all.group(:body).count
    #render json: Blip.group(:body).distinct.count(:sentence_id)
    total = @sentence.blips_count
    count = @sentence.blips.group(:body).distinct.count 
    top_results = count.sort_by { |k, v| v }.reverse[0..4].each { |k, v| puts "#{k}: #{v}" }
    #percentage = top_results.each { |k, v| my_hash[k] = v.upcase }
    #new_count = count.sort_by { |sentence, score| score }.reverse
    render json: top_results
    #new_count.limit(5)
    #render json: count.select{ |k, v| v == count.values.max }
   # where(sentence_id: params[:sentence_id], body: params[:body]).count.to_f
    #Blip.where(sentence_id: sentence.id).count.to_f
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
