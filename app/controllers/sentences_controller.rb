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
      @sentences = Sentence.all.order("created_at DESC") - current_user.sentences

    else
      @sentences = Sentence.all.order("created_at DESC")
    end

    #.blips.users.where(:user_id != current_user.id)
    # All Sentences where blip.users sentence_id is not present
  end

  def show
    @sentence = Sentence.find(params[:id])

    if current_user
      @sentences = Sentence.all - current_user.sentences
    else
      @sentences = Sentence.all
    end

    #@sentences = ([@sentence] + @sentences).uniq

    # Stats related vvvvv
    count = @sentence.blips.group(:body).distinct.count
    percent = count.each {|k, v| count[k] = v / @sentence.blips_count.to_f }
    top_results = percent.sort_by { |k, v| v }.reverse[0..4].flatten.each { |k, v| puts "#{k}: #{v}" }
    #{"sentences":[ ["nice",8],["moon",6],["food",6],["butts",6],["test",5] ]}
    #{stats: [{word: k frequency: v}]}

    render json: top_results
    
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
