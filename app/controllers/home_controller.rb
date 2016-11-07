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

end
