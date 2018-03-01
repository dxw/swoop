desc "Release HEAD as version v#{Swoop::VERSION} (value read from lib/swoop/version.rb)"
task :release do
  version = Swoop::VERSION
  puts "Tagging version #{version} and pushing to GitHub..."
  system("git tag v#{version}")
  system("git push --tags")
end

