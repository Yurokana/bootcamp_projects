# Homework rock   scissors  paper
# play unlimited time
# show result

weapons <- c("Rock","Scissors","Paper")
p_weapon2 <- 3
Player <- c()
Bot <- c()
Result <- c()

### Greeting
print("Welcome adventurer!!!")
print("Enter your name")
player_name <- readLines('stdin', n = 1)
print(paste("Hi",player_name,". I assume that you know the rules"))
print("Tell me when you are ready")
print("[1]I'm ready  [2]I'm not ready")
while(1){
  ready <- readLines('stdin', n = 1)
  if (ready == 1){
    print("Hehe boi")
    break
  }
  else if  (ready == 2){
    print("There is no time. You have to play now")
    break
  }
  else{
    print("Press [1] or [2]")
  }
}

### Play
Round <- 1
while(1){
  print(paste("Round",Round))
    while(1){
      print("Choose your weapon...")
      print("[1]Rock  [2]Scissors  [3]Paper")
      p_weapon <- as.numeric(readLines('stdin', n = 1))
      while(1){
        if (!(p_weapon %in% c(1, 2, 3)))  {
          
          while (1){
            print("Only 1,2,3")
            p_weapon2 <- as.numeric(readLines('stdin', n = 1))
            if (p_weapon2 %in% c(1, 2, 3)){
            p_weapon <- p_weapon2
            break
            }
            else {
            }
          }
        }
        else  {
          break
            }
          break
        
      }
      
      p_weapon2 <- 4
      break
    }
  print(paste("Your weapon is...",weapons[p_weapon]))
  b_weapon <- sample(1:3,1)
  print(paste("Bot weapon is...",weapons[b_weapon]))
  while(1){
    if (p_weapon - b_weapon == -1){
      print("Look like you are...")
      print("---------------------------")
      print("Win")
      print("---------------------------")
      result_round <- "Win"
      break
    }
    else if (p_weapon - b_weapon == 2){
      print("Look like you are...")
      print("---------------------------")
      print("Win")
      print("---------------------------")
      result_round <- "Win"
      break
    }
    else if (p_weapon - b_weapon == 0){
      print("Look like you are...")
      print("---------------------------")
      print("Tie")
      print("---------------------------")
      result_round <- "Tie"
      break
    }
    else{
      print("Look like you are...")
      print("---------------------------")
      print("Lose")
      print("---------------------------")
      result_round <- "Lose"
      break
    }
  }
Player <- c(Player,weapons[p_weapon])
Bot <- c(Bot,weapons[b_weapon])
Result <- c(Result,result_round)
Round <- Round+1
print("Play again?")
print("[1]Yes  [Any]No")
again <- readLines('stdin', n = 1)
  if (again ==1){
    print("**********************************")
  }
  else{
    break
  }
}
print("++++++++++++++++++++++")
print("Your journey")
History <- data.frame(Player,Bot,Result)
print(History)
print("++++++++++++++++++++++")
print("$$$$$$$$$$$$$$$$$$$$$$$")
print("Your stat")
as.data.frame(table(History$Player))
print("$$$$$$$$$$$$$$$$$$$$$$$")
print("##########################")
print("Your rate")

rate <- as.data.frame(table(History$Result))
print(rate)
print("##########################")
