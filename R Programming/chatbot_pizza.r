  amount <- c()
  crust <- c()
  flavor <- c()
  size <- c()
  price <- c()
  # welcome
  welcome1 <- function(){
    print("Welcome!!!  Are you looking for some pizza?:Y/N")
    welcome <- readLines("stdin", n=1)
    if (toupper(welcome) == "N"){
      print("You come to wrong place, But...you should try our pizza")
    }
    if (toupper(welcome) == "Y"){
      print("You come to right place!")
    }
    else {
      welcome1()
    }
  }
  
  #q0 What_you_want_to_do
  What_you_want_to_do <- function(){
    print("What you want to do?")
    print("1.Order some food")
    print("2.Check you basket")
    print("3.Pay")
    What_you_want_to_do_1 <- readLines("stdin", n=1)
      if (What_you_want_to_do_1 == 1){
        order()
      }
      if (What_you_want_to_do_1 == 2){
        order()
      }
      if (What_you_want_to_do_1 == 3){
        order()
      }
    else  {
      What_you_want_to_do()
    }
  }
  
  #q1 order
  order <- function(){
    print("What do you like to order?")
    print("1.Pizza")
    print("2.Appitizer")
    print("3.Drink")
    #print("0.No, just press the wrong key")
    order_1 <- readLines("stdin", n=1)
    while (1)
      #if (order_1==0){
        #What_you_want_to_do()
      #}
      if (order_1==1){
      break
      }
      else if (order_1==2){
        Appitizer()
        break
      }
      else if (order_1==3){
        Drink()
        break
      }
      else  {
        order()
      }
  }
  
  #Appitizer
  Appitizer <- function(){
    print("We sell only pizza eiei")
    print("Order pizza pless 1, go back pless any key")
    Appitizer1 <- readLines("stdin", n=1)
    while (1)
    if (Appitizer1==1){
      break
    }
    else {
      print("Your only choice is pizza")
      break
    }
  }
  
  #Drink
  
  Drink <- function(){
      print("We have only our secret signature Cannabis water")
      print("And you will get it for free after order our pizza")
      #print("Dont ask about that again. It's secret!")
    print("Order pizza pless 1, go back pless any key")
    Drink1 <- readLines("stdin", n=1)
    while (1)
    if (Drink1==1){
      break
    }
    else {
      print("Your only choice is pizza")
      break
    }
  }
############################################################################
### Start here
  welcome1()
  print("What's your name?")
  user_name <- readLines("stdin", n=1)
  print(paste("Hi", user_name, "Welcome again"))
  print("You can choose your choices of food by using your number key")
  order()


###

  while(1){  
    #q2 pizza 
    #pizza dough
    
      print("Select the Crust")
      print("1.Pan")
      print("2.Crispy Thin")
      print("3.Extreme Crust")
      print("4.New York Pizza Thin & Soft")
      
      while (1){
      crust1 <- readLines("stdin", n=1)
      if (crust1 == 1) {
        crust <- c(crust,"Pan")
        break
      }
      else if (crust1 == 2) {
        crust <- append(crust,"Crispy Thin")
        break
      }
      else if (crust1 == 3) {
        crust <- append(crust,"Extreme Crust")
        break
      }
      else if (crust1 == 4) {
        crust <- append(crust,"New York Pizza Thin & Soft")
        break
      }
      else  {
        print("Select 1-4")
      }
    }
    
    
    
    
    
    
    #q3 size
    
      print("Select the size")
      print("1.Small -> 100฿")
      print("2.Medium -> 200฿")
      print("3.Large -> 300฿")
      while (1){
      size2 <- readLines("stdin", n=1)
      if (size2 == 1) {
        size <- append(size,"Small")
        price <- append(price, 100)
        break
      }
      else if (size2 == 2) {
        size <- append(size,"Medium")
        price <- append(price, 200)
        break
      }
      else if (size2 == 3) {
        size <- append(size,"Large")
        price <- append(price, 300)
        break
      }
      else{
        print("Select 1-3")
      }
      
    }
    
    #q4 flavor
    
      print("Select the flavor")
      print("1.Tom yum kung")
      print("2.Durian")
      print("3.Cheese")
      print("4.Pepperoni")
      print("5.Hawaiian")
      print("6.Pineapple")
      while (1) {
      flavor2 <- readLines("stdin", n=1)
      if (flavor2 == 1) {
        flavor <- append(flavor,"Tom yum kung")
        break
      }
      else if (flavor2 == 2) {
        flavor <- append(flavor,"Durian")
        break
      }
      else if (flavor2 == 3) {
        flavor <- append(flavor,"Cheese")
        break
      }
      else if (flavor2 == 4) {
        flavor <- append(flavor,"Pepperoni")
        break
      }
      else if (flavor2 == 5) {
        flavor <- append(flavor,"Hawaiian")
        break
      }
      else if (flavor2 == 6) {
        flavor <- append(flavor,"Pineapple")
        break
      }
      else {
        print("Select 1-6")
      }
    }
    
    #q5 amount
    while(1){
      print("Please enter the amount of pizza")
      amount2 <- readLines("stdin", n=1)
      amount <- append(amount, amount2)
      #price <- as.numeric(price2)*as.numeric(amount2)
      break
    }
  
    #q6 order more?
    while(1){
      print("Confirm order?:Y/N")
      confirm1 <- readLines("stdin", n=1)
      if (toupper(confirm1) == "N"){
        amount <- amount[c(-length(amount))]
        crust <- crust[c(-length(crust))]
        flavor <- flavor[c(-length(flavor))]
        size <- size[c(-length(size))]
        price <- price[c(-length(price))]
        order_price <- as.numeric(amount)*as.numeric(price)
        if (length(amount) != 0){
        Your_order <- data.frame(amount,crust,flavor,size,price,order_price)
        print(Your_order)
        }
        break
      }
      else if (toupper(confirm1) == "Y"){
        order_price <- as.numeric(amount)*as.numeric(price)
        Your_order <- data.frame(amount,crust,flavor,size,price,order_price)
        print(Your_order)
        break
      }
      else {
        print("Y/N")
      }
    }
### more?
    print("Order more?:Y/N")
    more1 <- readLines("stdin", n=1)
    if (toupper(more1) == "N"){
      break
      }
    else if (toupper(more1) == "Y"){
      }
    else {
        while(1){
        print("Y/N")
        more2 <- readLines("stdin", n=1)
          if (toupper(more2) == "N"){
          break
          }
          else if (toupper(more2) == "Y"){
          break
          }
        }
      if (toupper(more2) == "N"){
        break
        }
        else if (toupper(more2) == "Y"){
        }
      }
  }

###summary
print("Your order list is shown below")
print(Your_order)
total <- colSums(Your_order[ncol(Your_order)])
print(paste("The total price is",as.numeric(total), "฿"))
water <- as.numeric(total)/100
print(paste("You will also get ", round(water, digits = 1), "bottle of our secert drink"))
print("For FREE")
print("(1 bottle per 100฿)")
print("Please enter your address")
address <- readLines("stdin", n=1)
print("Please select payment method")
while(1){
  print("1.Cash")
  print("2.Card")
  print("3.Coupon")
  payment1 <- readLines("stdin", n=1)
  if (payment1 == 1) {
      payment <- "Cash"
      break
    }
    else if (payment1 == 2) {
      payment <- "Card"
      break
    }
    else if (payment1 == 3) {
      payment <- "Coupon"
      break
    }
  else  {
    print("1-3")
  }
}

print("Your food will be arrive in 10 mins")
print(paste("Please prepare your",payment))
print("Bye eiei")
