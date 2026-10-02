# Each test file runs in its own process so the integration test can boot
# Rails before the gem is required, the way Bundler.require does in an app.
task :test do
  Dir["test/**/*_test.rb"].sort.each do |file|
    ruby "-Ilib", "-Itest", file
  end
end

task default: :test
