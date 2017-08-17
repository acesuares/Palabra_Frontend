class FrontendController < ApplicationController

  def index
    @wordtype = Wordtype.find(params[:wordtype][:id]) rescue nil
    @goal = Goal.find(params[:goal][:id]) rescue nil
    @source = Source.find(params[:source][:id]) rescue nil

    @taal = params[:taal]
    @taal = 'pap_cw' unless ['nl','en','es','pap_cw'].include?(@taal)

    if params[:searchword]
      search = "%" + params[:searchword].strip + "%"
      case @taal
      when "nl"
        @words = Word.nederlands.where("tr_nl like ? OR tags LIKE ? ", search, search)
      when "es"
        @words = Word.spaans.where("tr_es like ? OR tags LIKE ? ", search, search)
      when "en"
        @words = Word.engels.where("tr_en like ? OR tags LIKE ? ", search, search)
      else
        @words = Word.where("name like ? OR tags LIKE ? ", search, search).order(:name)
      end
    else
      case @taal
      when "nl"
        @words = Word.nederlands
      when "es"
        @words = Word.spaans
      when "en"
        @words = Word.engels
      else
        @words = Word.order(:name)
      end
    end

    @words = @words.where(wordtype_id: @wordtype.id) unless @wordtype.nil?
    @words = @words.where(goal_id: @goal.id) unless @goal.nil?
    @words = @words.where(source_id: @source.id) unless @source.nil?
    @words = @words.page(params[:page])

  end
  
  def searchform
  end
end
