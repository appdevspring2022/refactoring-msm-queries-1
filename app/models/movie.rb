# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  def title_with_year
    result = self.title + " (" + self.year.to_s + ")"
    return result
  end

  def director
    director_id=self.director_id
    director=Director.where({:id=>director_id}).at(0)
    return director
  end

  def characters
    movie_id=self.id
    characters=Character.where({:movie_id=>movie_id})
    return characters
  end

  def cast
    characters=self.characters
    actors_id=characters.map_relation_to_array(:actor_id)
    actors= Actor.where({:id=>actors_id})
    return actors
  end
end
