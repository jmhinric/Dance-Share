class SearchSuggestion < ActiveRecord::Base
  def self.terms_for(prefix)
    suggestions = where("term like ?", "#{prefix}_%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end

  def self.index_companies
    Company.find_each do |company|
      index_term(company.name)
    end
  end

  def self.index_term(term)
    where(term: term).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity, by = 1
    end
  end

  # rake task:  $rake search_suggestions:index
end
