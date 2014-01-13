module MultiBlog
  class << self
    def registered(app)
	app.helpers Helpers
    end
    alias :included :registered
  end

  module Helpers
    def all_articles()
        all = []
	blog_instances.each do |key,blog|
	  if (key.to_s != 'baka na inu') then
          	all.push(*blog.data.articles)
	  end
        end
        all.sort! { |a,b| b.date <=> a.date }
    end

  end

end

::Middleman::Extensions.register(:all_articles, MultiBlog) 
