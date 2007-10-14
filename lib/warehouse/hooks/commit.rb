module Warehouse
  module Hooks
    class Commit
      class << self
        attr_accessor :svnlook_path

        def run(repo_path, revision, hook_options)
          commit = new(repo_path, revision)
          hook_options.each do |(hook_class, options)|
            hook = hook_class.new(commit, options)
            hook.run! if hook.valid?
          end
        end
      end
      
      attr_reader :repo_path
      attr_reader :revision
      
      def changed_at
        @changed_at ||= Time.parse(svnlook(:date))
      end
      
      def author
        @author ||= svnlook :author
      end
      
      def dirs_changed
        @dirs_changed ||= svnlook 'dirs-changed'
      end
      
      def log
        @log ||= svnlook :log
      end
      
      def changed
        @changed ||= svnlook :changed
      end
      
      self.svnlook_path = '/usr/bin/svnlook'
      
      def initialize(repo_path, revision)
        @repo_path = repo_path
        @revision  = revision
      end
      
      protected
        def svnlook(cmd)
          `#{self.class.svnlook_path} #{cmd} #{@repo_path} -r #{@revision}`.strip
        end
    end
  end
end