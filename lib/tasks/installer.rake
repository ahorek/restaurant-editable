namespace :application do
  desc <<-END_DESC
  Example:
    bundle exec rake appication:clear_cache RAILS_ENV=production --trace
  END_DESC
  task :clear_cache => :environment do
    cache_store = ActionController::Base.cache_store
    if cache_store.present? && cache_store.respond_to?(:cache_path) && File.exist?(cache_store.cache_path)
      begin
        ActionController::Base.cache_store.clear
      rescue
        pp "Cache on #{ActionController::Base.cache_store.cache_path} was not deleted. You should do it manually."
      end
    end
  end

  desc <<-END_DESC
    Example:
      bundle exec rake application:install RAILS_ENV=production
  END_DESC

  task :install do
    puts 'Invoking generate_secret_token...'
    Rake::Task['generate_secret_token'].invoke
    puts 'Invoking generate_devise_initializer...'
    Rake::Task['generate_devise_initializer'].invoke
    puts 'Invoking clearing session...'
    Rake::Task['tmp:sessions:clear'].invoke
    puts 'Invoking db:migrate...'
    Rake::Task['db:migrate'].invoke
    puts 'Invoking assets:precompile...'
    Rake::Task['assets:precompile'].invoke
    puts 'Invoking application:clear_cache...'
    Rake::Task['application:clear_cache'].invoke
  end
end
