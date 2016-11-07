class HomeController < ApplicationController
  def index
    @boxContent = Hash.new
    name = ["K관", "J관", "MA관", "AS관", "D관", "RA관", "R관", "X관", "GA관"]
    backColor = ["#fb9782", "#fb7f8b", "#311521", "#dfddcd", "#c7646c", "#fb9782", "#311521", "#d1b8b1", "#fb7f8b"]
    for i in 0..8
      boxStyle = {:name => name[i], :backgroundColor => backColor[i]}
      @boxContent[i] = boxStyle
    end

  end

  def result
    @building = paramCheck(params[:building])
  end

  private
  def paramCheck(para)
    if para == "0"
      building = "K"
    elsif para == "1"
      building = "J"
    elsif para == "2"
      building = "MA"
    elsif para == "3"
      building = "AS"
    elsif para == "4"
      building = "D"
    elsif para == "5"
      building = "RA"
    elsif para == "6"
      building = "R"
    elsif para == "7"
      building = "X"
    elsif para == "8"
      building = "GA"
    end

    building
  end
end
