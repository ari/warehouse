namespace :warehouse do
  namespace :svn do
    desc 'Create subversion repository'
    task :create do
      path = ENV['PATH'].chomp('/')
      `svnadmin create #{path}`
    end
  end
end
