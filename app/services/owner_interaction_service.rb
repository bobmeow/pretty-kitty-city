class OwnerInteractionService

attr_reader :kind, :owner_id, :pet


  def initialize(kind, owner_id, pet)
    @kind = kind
    @owner_id = owner_id
    @pet = pet
  end

  def create_and_update_pet_mood_level
    create_owner_interaction
    update_pet_mood_level
  end

  def create_owner_interaction
    OwnerInteraction.create(kind: kind, owner_id: owner_id)
  end

  def update_pet_mood_level
    if kind == "scratch"
      scratch
      {notice: 'THanks for scratching', img_src: ''}
    elsif kind == "feed"
      feed
    elsif kind == "lick"
      lick
    elsif kind == "groom"
      groom
    elsif kind == "play"
      play
    end
    @pet.save
  end

private
    def scratch
      if @pet.mood_level < 15
      @pet.mood_level += 1
      # flash[:notice] = " Thank you for scratching me! I'm Happier. Previously scratched on #{previous_interaction_time}"
      # flash[:img_src] =  "#{@owner_interactions.display_gif}"
      else
        @pet.mood_level
      # flash[:notice] = "**bats hand** go away, human!"
      # end
      end
    end

    def feed
     if @pet.mood_level < 15
       @pet.mood_level += 2
       @pet.save
       flash[:notice] = " That was tasty. Previously fed on #{previous_interaction_time}"
       flash[:img_src] =  "#{@owner_interactions.display_gif}"
      else
       flash[:notice] = "burp! I'm full."
     end
   end

   def play
    if @pet.mood_level < 15
      @pet.mood_level += 1
      @pet.save
      flash[:notice] = " That was fun. Previously played with on #{previous_interaction_time}"
      flash[:img_src] =  "#{@owner_interactions.display_gif}"
     else
      flash[:notice] = "burp! I'm full."
    end
  end

  def groom
   if @pet.mood_level < 15
     @pet.mood_level += 2
     @pet.save
     flash[:notice] = " That was tasty. Previously fed on #{previous_interaction_time}"
     flash[:img_src] =  "#{@owner_interactions.display_gif}"
    else
     flash[:notice] = "burp! I'm full."
   end
 end

 def lick
     if @pet.mood_level > 0
       @pet.mood_level -= 2
       @pet.save
       flash[:notice] = "MEOW! Previously annoyed on #{previous_interaction_time}"
       flash[:img_src] =  "#{@owner_interactions.display_gif}"
     else
       flash[:notice] = "hisss! This is WEIRD!"
     end
   end

   def previous_interaction_time
     previous_interaction = OwnerInteraction.where(owner_id: session[:user_id]).where(kind: params[:kind]).order(created_at: :desc).second
     if previous_interaction
       formatted_time = previous_interaction.created_at.strftime("%b %d, %I:%M:%p")
     else
       previous_interaction = "never ever before!!!"
     end

     #database is in UTC time, five hours ahead of EST
   end

   def current_interaction_time
     current_interaction = @owner_interactions.created_at
   end

   def time_since_last_interaction
     current_interaction_time - previous_interaction_time
   end


end
