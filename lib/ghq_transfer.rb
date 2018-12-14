require 'fileutils'
require 'pathname'
require 'uri'

module GhqTransfer
  class Core
    def initialize(options)
      @options = options
    end

    def run
      puts valth? ? '*** VALTH!! ***' : '*** dry run ***'

      ghq_root = Pathname(`ghq root`.chomp)

      Dir.glob(ghq_root.join('*')).each do |src|
        next unless File.ftype(src) == 'directory'

        puts "[DEBUG] #{src}" if @options[:debug]

        Dir.chdir(src)

        origin_url = `git config --get remote.origin.url`

        next if origin_url.empty?

        origin_url.chomp!

        begin
          host, user, repo = if /^git@.+/ === origin_url
                               extract_paths_from_ssh(origin_url)
                             else
                               extract_paths_from_https(origin_url)
                             end

          dest_dir = ghq_root.join(host, user)
          dest_path = dest_dir.join(repo)

          puts "#{src} -> #{dest_path}"

          if valth?
            FileUtils.mkdir_p(dest_dir)

            FileUtils.mv(src, dest_path)
          end
        rescue
          puts "[SKIP] #{src}"
        end
      end
    end

    private

    def valth?
      @options[:dry_run].! && @options[:valth]
    end

    def extract_paths_from_ssh(url)
      /git@(.+):(.+)\/(.+)/ === url

      host = $1
      user = $2
      repo = $3

      repo.gsub!(/\.git$/, '') if repo

      [host, user, repo]
    end

    def extract_paths_from_https(url)
      uri = URI.parse(url)

      host = uri.host
      _, user, repo = uri.path.split('/')
      repo.gsub!(/\.git$/, '')

      [host, user, repo]
    end
  end
end
