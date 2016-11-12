
#Q-1. 
#	Import the Bollywood data set in Rstudio. Make sure that the data file is in the folder (directory) where
# you are currently working.
     
	bollywood <- read.csv("bollywood.csv",header = T)

#Q0.
#	When you import a data set, R stores character vectors as factors (by default).
# Change the attribute 'Movie' from factor to character type. 
     
	bollywood$Movie <- as.character(bollywood$Movie)

	 
	 
#Q1.
#	Create a vector "first_10" and store the first 10 movies (from top) from the bollywood dataset.
# Use the column bollywood$Movie
     
	first_10 <- bollywood$Movie[1:10]
    
	
#Q2.
#	What is the name of 7th movie from the top?
     
	movie_7 <- bollywood$Movie[7]
     
	 
#Q3. 
#	How many rows and columns are present in the bollywood dataset? 
     
	rows <- nrow(bollywood)
  columns <- ncol(bollywood)
	
	 
#Q4.
#	Find out the total number of  missing values (NA) in the dataset.
     
	na_bollywood <- length(which(is.na(bollywood)))

	
#Q5.
#	How many variables are of type 'factor' in the dataset. Try using the str function 
# on bollywood. Assign the numeric value to fact_vars.
	
     str(bollywood) #this displays 3 columns, Hero, Rdate and verdict as factors. Indexes are 2,3,8 respectively
     boolean_vector_columns <- lapply(bollywood, is.factor) # find if every column is a vector or not
	fact_vars <- length(which(boolean_vector_columns==TRUE)) #total number of factor variables
    
	
#Q6.0 
#	Now let's find out the movies shot by Salman, SRK and Akshay separately.
# subset() function is used for that. The code has already been written for you. 
 
  salman <- subset(bollywood, Hero == "Salman")
  srk <- subset(bollywood,Hero == "SRK")
  akshay <- subset(bollywood,Hero == "Akshay_Kumar")
     
 
#Q6.1 
#	What is the total collection of Akshay, Salman and SRK movies individually?
# Look for a column named 'Tcollection'.
 
  
  akshay_collection <- sum(akshay$Tcollection)
	salman_collection <- sum(salman$Tcollection)
	srk_collection <- sum(srk$Tcollection)

#Q6.2 
#	Among the three actors, who has done the most number of movies?
# Store "akshay", "salman" or "srk" as the variable name most_movies_actor.
# (only the correct answer)
     
	nrow(akshay)
	nrow(salman)
	nrow(srk) 
	#After executing the three statements, akshay shows highest number
  most_movies_actor <-  "akshay"
    
	
#Q6.3
# Also, whose collection is the largest (total collection/Tcollection)? 
    
	# from 6.1 salman is the largest collection
	largest_collection_actor <- "salman"
     
     
#Q7 Let's try to find out which actor has made the largest opening collection (Ocollection).
#	First, let's see which movie has made the largest opening collection.
# Find out the maximum collection amount first.
    
	max_number <- max(bollywood$Ocollection)

# Great. You got a number as the output. Now you can use which() function to get the index
# of the row where max_number is located. This code is already written for you.
	
  row_num <- which(bollywood$Ocollection == max_number)

	
#	We know the row number corresponding to maximum collection now. To get the actor,
#	extract the relevant column corresponding to row_num.
    
	max_opening_actor <- bollywood[row_num,2]

#Q8 
#	In which month most movies were released? Note that we are talking about dates and months now.
# Let's first install the lubridate package.
    
	install.packages("lubridate")
    
#   After installing any package, we have to load it into the R environment.
	
	library(lubridate)
	
#   The month() function in lubridate extracts the month from a date format.
#   Apply month() to the date column of bollywood.
 
    bollywood$month <- month(bollywood$Rdate)
	
#   as.factor() function converts months into factors.
#   Apply as.factor() to bollywood$month
    
	  bollywood$month <- as.factor(bollywood$month)
	
#   A great way to look at the summary of a data frame is the summary() function.
#   Look at the summary of bollywood data set.
 
    summary(bollywood)
    #from summary, we can observe that Month 10 i.e. October has the highest number of releases

#Q9 
#	How many movies are in flop,average, Hit & Superhit categories. Simply see the summary of 
#	the column 'Verdict'.

    summary(bollywood$Verdict)
    # 15 average, 22 flop, 11 hit, 4 superhit

#Q10.1 
#	Find the date on which three movies had launched on the same day?

    date_three <-  names(which(table(bollywood$Rdate)==max(table(bollywood$Rdate))))
    
    
#Q10.2 
#   Find the names of the movies released on date_three and store them in movie1, movie2 and movie3.
    
	  movie_index <- which(bollywood$Rdate == date_three)
	
	
    movie1 <- bollywood$Movie[movie_index[1]]
    movie2 <- bollywood$Movie[movie_index[2]]
    movie3 <- bollywood$Movie[movie_index[3]]
    
	
#Q11. 
#	Convert the Rdate column into date format. 
    
	bollywood$Rdate <- as.character(bollywood$Rdate)
  bollywood$Rdate <-  as.Date(bollywood$Rdate, "%m-%d-%Y")
    
	
# see structure to check if you got it right. 
	str(bollywood)
    
	
	
#Q12. 
#	Change all the characters of movie names into lower case 
# Hint: tolower()
    
	bollywood$Movie <- tolower(bollywood$Movie)

	
# Finally, view the data frame again
    
	View(bollywood)
	
	

   
    


    
    
    