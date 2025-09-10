# Name: Irwin Ortega
# Course: MIS446
# Module: 3

# Step 2: Calculate probabilities for commute times based on a normal distribution
# Given: Mean (mu) = 75 minutes, Standard Deviation (sigma) = 15 minutes.
commute_mean <- 75
commute_sd <- 15

# Question 1: What is the probability that tomorrow morning's commute will take more than 50 minutes?
# We want P(X > 50). In R, pnorm() gives P(X <= q).
# So, P(X > 50) = 1 - P(X <= 50).
prob_more_than_50 <- 1 - pnorm(50, mean = commute_mean, sd = commute_sd)
cat("Probability commute > 50 minutes:\n")
print(prob_more_than_50)

# Question 2: If she leaves her home at 9:00 to attend a faculty meeting commencing at 10:30,
# what is the probability she will be late to the meeting?
# She has 90 minutes to get to the meeting (10:30 - 9:00 = 1 hour 30 minutes = 90 minutes).
# She is late if her commute takes MORE than 90 minutes.
# So, we want P(X > 90) = 1 - P(X <= 90).
prob_late_meeting <- 1 - pnorm(90, mean = commute_mean, sd = commute_sd)
cat("\nProbability she will be late to the meeting (commute > 90 minutes):\n")
print(prob_late_meeting)

# Step 3: Print current date and time and username (First Instance)
cat("\nCurrent Date and Time (First Instance):\n")
print(Sys.time())

# Get the username from the system. This code handles if the username is blank.
username_val <- Sys.getenv("username")
if (username_val == "") {
  username_val <- "irwin.o" # Use a placeholder if system username is empty
}
cat("\nUsername (First Instance):\n")
print(username_val)

# Step 4: How long must her commute be if she is to go for her swim (top 10% in duration)?
# "Top 10%" means the probability to the RIGHT of that value is 0.10.
# The qnorm() function works with the probability to the LEFT.
# So, if area to the RIGHT is 0.10, then area to the LEFT is 1 - 0.10 = 0.90.
# We are looking for the 90th percentile.
commute_for_swim <- qnorm(0.90, mean = commute_mean, sd = commute_sd)
cat("\nCommute duration for her to go for a swim (90th percentile):\n")
print(commute_for_swim)

# Step 5: Print current date and time and username (Second Instance)
cat("\nCurrent Date and Time (Second Instance):\n")
print(Sys.time())

cat("\nUsername (Second Instance):\n")
print(username_val) # Re-using the username_val variable from Step 3