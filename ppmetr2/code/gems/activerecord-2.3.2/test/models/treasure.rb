#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
class Treasure < ActiveRecord::Base
  has_and_belongs_to_many :parrots
  belongs_to :looter, :polymorphic => true

  has_many :price_estimates, :as => :estimate_of
end
