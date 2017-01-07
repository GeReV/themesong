require 'open3'

class YoutubeDl
  def self.download(url, &block)
    run(url, &block)
  end

  private

  CMD = "#{Rails.root.join('bin', 'youtube-dl')} --newline %s"

  def self.run(url, &block)
    Open3.popen3(CMD % url) do |stdin, stdout, stderr, thread|
      stdout.each do |line|
        block.call(line)
      end
    end
  end
end
