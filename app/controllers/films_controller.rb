class FilmsController < ApplicationController
	def index
		require 'digest/sha1'
		require 'Hpricot'
		require "#{Rails.root}/libimdb/imdb.rb"
		@rep_sources = RepSource.all
		res=[]
		@rep_sources.each{|s|
			res.push(s.path)
			Dir.chdir(s.path)
			Dir.glob("**/*{.mkv,.avi,.mpg,.mp4}").each{|x|
				#	puts "Got #{x}" 
				file = File.new(x,'r')
				num = file.read(2**16)
				sha1 = Digest::SHA1.hexdigest(num)
				#	puts sha1
				res.push(x)
				#res.push(sha1)
				xprime=x.gsub(/^.*\//,'').gsub(/\[[^\[]*\]/,'').gsub(/\....$/,'').gsub(/[^0-9][1-2][0-9]{3}.*$/,'()').gsub(/\(.*\)/,'').gsub(/[^A-z]/,' ').gsub(/_/,' ')
					#res.push(xprime)
					i = Imdb::Search.new(xprime)
					unless i.movies == [] then
						res.push(i.movies[0].title)
						res.push(i.movies[0].id)
					end
			}
		}
		@liste=res.compact
	end

	def rebase

	end

end
