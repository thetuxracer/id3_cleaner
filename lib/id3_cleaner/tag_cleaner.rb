module Id3Cleaner

  module ScrubIdV1
    # puts (File.join(File.dirname(__FILE__), '..', 'test'))
    Dir.chdir('/Users/thetTuxRacer/Music/MP3/Hindi')
    mp3s = Dir.glob('**/*').select { |filename| filename =~ /\.mp3/i }
    # mp3s = Dir.glob('**/test/**/*').select { |filename| filename =~ /\.mp3/i }
    puts mp3s
    regex = /[http:\/\/]?[\S]+\.[a-zA-Z]{2,4}/

    mp3s.each do |file|
      list_1 = []
      next if file !~ /.mp3$/i # skip files not ending with .mp3
      Mp3Info.open(file) do |mp3|

        # mp3.tag2["TCON"] = "Bollywood"
        # puts file
        # puts mp3.tag2["TCON"]
        mp3.tag1.each do |key, value|
          list_1 << key
        end

        list_1.each do |tag_name|
          file = mp3.tag1
          if !file[tag_name].nil? && file[tag_name].class.eql?(String) && file[tag_name].match(regex)
            # TODO Replace puts with proper logging messages.
            puts "Replacing value of #{tag_name}. Currently is #{mp3.tag1[tag_name]}"
            mp3.tag1[tag_name] = file[tag_name].gsub(regex, "")
            puts "Replaced value of #{tag_name}. New value is #{mp3.tag1[tag_name]}"
          end
          # puts mp3.tag2.tag_name
        end

      end
    end
  end

  module ScrubIdV2
    mp3.tag2.each do |key, value|
      list_2 << key
    end

    list_2.each do |tag_name|
      # puts mp3
      file = mp3.tag2
      # puts file
      # puts tag_name if file[tag_name].nil?
      # puts file[tag_name]
      # puts file[tag_name].class
      if !file[tag_name].nil? && file[tag_name].class.eql?(String) && file[tag_name].match(regex) && !tag_name.eql?("APIC")
        # TODO Replace puts with proper logging messages.
        puts "Replacing value of #{tag_name}. Currently is #{mp3.tag2[tag_name]}"
        mp3.tag2[tag_name] = file[tag_name].gsub(regex, "")
        puts "Replaced value of #{tag_name}. New value is #{mp3.tag2[tag_name]}"
      end
      # puts mp3.tag2.tag_name
    end
  end

  module RenameDirectory

    # folder_names = Dir.glob('/Users/thetTuxRacer/Music/temp/**').select { |directory| File.directory?(directory) }
    # Dir.chdir('/Users/thetTuxRacer/Music/temp/')
    # Dir.chdir(File.expand_path("..","test/**"))
    # folder_names = Dir.glob('**').select { |directory| File.directory?(directory) }
    # dir_regex_url = /\([\S]+\.[a-zA-Z]{2,4}\)/
    # bitrate_regex = /[0-9]+Kbps/
    # year_regex = /\(?-?[0-9]{4}\)?/

    # folder_names.each do |file|

    #   # puts file
    #   year = file.match(year_regex).to_s.gsub("-", "").gsub("(", "").gsub(")","")

    #   new_name =  file.gsub(dir_regex_url, "").gsub(bitrate_regex, "").gsub(year_regex, "").gsub("-", " ").strip
    #   # new_name = "#{new_name}" unless year.empty?
    #   newer_name = new_name.split.map(&:capitalize).join(' ')
    #   # puts new_name
    #   # puts newer_name
    #   puts "Renaming #{file} to #{new_name}"
    #   File.rename(file, newer_name)
    # end
    # end
  end
end
