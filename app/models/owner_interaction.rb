class OwnerInteraction < ApplicationRecord

belongs_to :owner, :class_name => 'User'

  def display_gif
    if self.kind == "scratch"
      display_scratch_gif
    elsif self.kind == "groom"
        display_groom_gif
      elsif self.kind == "play"
          display_play_gif
        elsif self.kind == "feed"
            display_feed_gif
          elsif self.kind == "lick"
            display_lick_gif
  end
end

  def display_scratch_gif
      '<a href="http://i.imgur.com/we9Ofbx.gifv">Purr!!</a>'
  end
  def display_groom_gif
    '<a href="http://i.imgur.com/azAaucB.gif">Purr!!</a>'
  end
  def display_play_gif
    '<a href="http://i.imgur.com/tCVqM8O.gifv">Purr!!</a>'
  end
  def display_feed_gif
    '<a href="http://giphy.com/gifs/aOqVDcqUQt1BK">Yummy!</a>'
  end
  def display_lick_gif
    '<a href="http://giphy.com/gifs/cat-discussion-lists-5LU6ZcEGBbhVS">*hiss*!</a>'
  end

end
