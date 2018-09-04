setwd("C:/Users/Darren Levett/Desktop/R Shiny") 
#change this directory if hosting on a LAN. Use forward slash. Must be used with runApp()
runApp(host="0.0.0.0",port=358) #0.0.0.0 for LAN, 127.0.0.1

#or
#runApp() in server.R

#runApp(host="0.0.0.0",port=358) allows LAN connections.
#host 0.0.0.0 takes the IPv4 address as the host and port sets the port.
#To find IPv4 address on Windows, go to the command prompt and type ipconfig