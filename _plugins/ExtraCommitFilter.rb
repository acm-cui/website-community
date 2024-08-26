require 'jekyll'
require 'jekyll-last-commit'

module Jekyll
    module ExtraCommitFilter
      def data_file_mtime(input)
        site = @context.registers[:site]
     
        repo_man = JekyllLastCommit::RepoMan.new(site.source)
        repo_man.discover_repo()
        repo_man.discover_commits(site.documents.map {|d| d.relative_path })
        repo_man.discover_commits(site.documents.map {|p| p.relative_path })

        github_repo = site.config.dig('github', 'repo') + "commit/"
        github_link_title = site.config.dig('github', 'link_title')

        date_format = site.config.dig('jekyll-last-commit', 'date_format')
        date_format ||= '%B %d, %Y'

        commit = repo_man.find_commit("_data/" + input)
        raw_time = Time.at(commit["time"].to_i)
        '<a href="' + github_repo + commit['sha'] + '/" title="' + github_link_title + '">' + raw_time.strftime(date_format) + '</a>'
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::ExtraCommitFilter)