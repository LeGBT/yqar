class FilmsController < ApplicationController
  def index
	  	require 'digest/sha1'
		@rep_sources = RepSource.all
		res=[]
		@rep_sources.each{|s|
#			puts s.path
			Dir.chdir(s.path)
			Dir.glob("**/*{.mkv,.avi,.mpg,.mp4}").each{|x|
				#	puts "Got #{x}" 
				file = File.new(x,'r')
				num = file.read(2**16)
				sha1 = Digest::SHA1.hexdigest(num)
				#	puts sha1
				res.push(x)
				res.push(sha1)
			}
		}
		@liste=res.compact
  end

end
