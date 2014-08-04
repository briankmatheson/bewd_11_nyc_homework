#HW

magicnumber = 7;
 
begin
 
    puts( "Guess the number between 1 and 10" );
    print( "Guess: " );

 
    userGuess = gets().to_i();
 
    if (userGuess < magicnumber)
 
        puts( "...Guess higher!" );
 
    elsif (userGuess > magicnumber)
 
        puts( "...Guess lower!" );
 
    end
 
end while( userGuess != magicnumber )
 
 
puts( "Heck yeah! You guessed #{magicnumber} correctly!" );