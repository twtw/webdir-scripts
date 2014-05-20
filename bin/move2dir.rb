# _*_ encoding: utf-8 _*_
#
# move all filenames such as _2014_05_20_00_07_44.jpg  to yyyymmdd/hh/ directory
#
require "fileutils"

files = Dir.open('./').select{|x| x=~/\.jpg/}
files.each do |file|
  x,y,m,d,h,mm,s = file.split('_')
  ymddir = y+m+d
  hdir = ymddir + '/' + h
  Dir.mkdir ymddir unless Dir.exist? ymddir
  Dir.mkdir hdir unless Dir.exist? hdir
  FileUtils.mv(file,hdir+'/'+file) if Dir.exist? hdir
end

