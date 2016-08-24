###################################
######  CLASS METHODS & SELF  #####
###################################

#Currently we have been creating classes expect many object to be created from them to utilize their functionality.

#With the help of the keyword 'self', we will have


###################################
######     LEARNING GOALS     #####
###################################

# Review what we've learned about classes so far:
    #Constructor (initialize)
    #Instance Methods
    #Attributes (stored in instance variables)

# Discover new functionality within classes:
    # Class Methods and
    # self


###################################
######      CLASS_REVIEW      #####
###################################

## INSTANCE VARIABLES
## ATTRIBUTES(adv.)


## INSTANCE METHODS
  #behaviors
#     # ex: make a post, send a message, like a poste, create a photo album
# class User
#   def initialize
#     @name
#   end
#
# #INITIALIZE METHOD
#   def add_username(name)
#     @name =name
#   end
# end

#.method
#.class

# user1 = User.new
# puts user1.method





# class Order
#   def initialize(subtotal, quantity) # <= instance method
#     @subtotal = subtotal
#     @quantity = quantity
#   end
#
#   def total # <= instance method
#     @subtotal * @quantity
#   end
#
#   def to_money # <= instance method
#     # in the line below, `total` is invoking the instance method above
#     "$" + sprintf("%0.02f", total / 100)
#   end
# end
#
# order = Order.new(1000, 2)
# order.to_money #=> $20.00


###################################
########    CLASS METHODS   #######
########     USING SELF     #######
###################################

#Class methods are called directly by the class and not by an instance of the class.
#
# class Kitten
#   def self.say_meow # do not use initialize
#     return "meow"
#   end
# end
#
# puts Kitten.say_meow.upcase # call directly on the class
#reason see gem facker

#do not need initialize method because we do not need to create individual instance of the method
# like Kitten.new


###################################
######    LETS TRY IT OUT!    #####
###################################


class Pawn
  attr_reader :position
  def initialize(position)
    @position = position
  end
#
#   # This is the class method, it starts with self.
#   # It is only called on the class directly Pawn.make_row
  def self.make_row(side)
    if side == "white"
      num = 2
    else
      num = 7
    end

    pawns = []    # pick a row in a matrix
    ("a".."h").each do |letter|
      pawns << self.new("#{letter}#{num}") # create an object inside itself
    end
    pawns
  end
end
#
# #make one pawn
one_pawn = Pawn.new("A2")
one_pawn.make_row("purple")
# because self.make_row, you can only call it on the class Pawn. Can not call it on an individual object.
# .new is a class method. pre-written self. method.

# #
# # #make a whole row of pawns
# pawns = Pawn.make_row("black")
# #
# # #What is being stored in this local variable pawns?
# pawns.each do |pawn|
#   puts pawn.position
# end
# #
# #WHAT IS THIS DOING!?
puts pawns.shuffle.first.position



###################################
######   WHERE IS THIS USED?  #####
###################################
#Class methods are for anything that does not deal with an individual instance of a class


#In Gems, like faker
  #https://github.com/stympy/faker/blob/master/lib/faker/hacker.rb

#When we get into databases, our data will be tied to a class. That class will have some premade class methods for us to use:  .find, .last, .where
#Those class methods allow you to find specific objects of that class based on an specified attributes of that class.
