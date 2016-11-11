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

  require 'time'

  def result
    @building = paramCheck(params[:building])
    @selectedBuilding = ClassRoom.where(:building_name => @building)
    @resultTable = Hash.new{|hsh,key| hsh[key] = [] }

    @today = Date.today.strftime("%A").downcase
    @today = @today[0, 3] # 요일의 앞의 3글자만 받아오기

    currentTime = Time.now.change(hour: 10)
    @selectedBuilding.each_with_index do |b, i|
      time = ClassTime.where(:class_room_id => b.id)
      time.each do |t|
        if @today == t.dayoftheWeek # 요일 매칭
          # 현재 시간 4시 35분
          # 현재 시간의 구간에 걸쳐 있는 강의실 출력 + 이후 강의
          # 04:30 ~ 05:45
          if currentTime <= Time.parse(t.to)
            @resultTable[b.full_name] << [t.from, t.to]
          end
        end
      end
      unless @resultTable.nil?
        @resultTable[b.full_name].sort!
      end
    end
    @reverseTable = reverseTime(@resultTable, currentTime)
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


  def reverseTime(resultTable, currentTime)
    reverseTable = Hash.new{|hsh,key| hsh[key] = [] }

    resultTable.each do |key, value|
      time = ["09:00", "10:30", "12:00", "13:30", "15:00", "16:30"]
      value.each do |v|
        if time.include?(v[0])
          time.delete(v[0])
        end
      end
      time.each do |t|
        if currentTime > Time.parse(t)
          time.delete(t)
        end
      end

      reverseTable[key] << time
    end

    reverseTable
  end


end
