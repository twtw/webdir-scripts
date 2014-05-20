# _*_ encoding: utf-8 _*_
#
# create file list index file in the current directory
# ls *.jpg > list.txt
# ruby create_index.rb > index.html
#
arr=File.readlines('./list.txt').map(&:chop)
arr.each{|i| puts "<a href=#{i} target=_blank>#{i}</a><br />"}
