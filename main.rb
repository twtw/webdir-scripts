# _*_ encoding: utf-8 _*_

class Picture < Sinatra::Base

  PICroot = EDIT ME
  get "/" do
    @days = Dir.open(PICroot).select{|x| x =~ /\d{8}/}.sort.reverse
    @days.unshift "today"
    slim :index
  end

  get "/day/:day" do
    @day = params[:day]
    daydir = PICroot+"/"+@day
    if Dir.exists? daydir
      @hours = Dir.open(daydir).select{|x| x =~ /\d\d/}
      slim :day
    else
      "沒有此目錄"
    end
  end

  get "/:day/:hour" do
    @day = params[:day]
    @hr = params[:hour]
    hdir = PICroot+"/"+@day+"/"+@hr
    if Dir.exists? hdir
      @pics = Dir.open(hdir).select{|x| x =~ /\.jpg$/}
      slim :pictures
    else
      "no picture directory"
    end
  end

  get "/today" do
    hdir = PICroot+"/today"
    @day = 'today'
    @pics = Dir.open(hdir).select{|x| x =~ /\.jpg$/}
    slim :pictures
  end


end
