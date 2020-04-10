# Python program to check if a string 
# contains any special character "wpoeiqoeiq pqowieq pqowei qpqioe peqioe q23948204 0293 24928 09428 204 30294"
# Python [werpweirpweriw ori epori ewori pweori piwpori wpoer peri wpor iwpor wpeor]
  
# import required package 
import re 
  
# Function checks if the string 
# contains any special character 
def run(string): 
  
    # Make own character set and pass  
    # this as argument in compile method 
    regex = re.compile('[@_!#$%^&*()<>?/\|}{~:]') 
      
    # Pass the string in search  
    # method of regex object.     
    if(regex.search(string) == None): 
        print("String is accepted") 
          
    else: 
        print("String is not accepted.") 
      
  
# Driver Code 
if __name__ == '__main__' : 
      
    # Enter the string 
    string = "Geeks$For$Geeks"
      
    # calling run function  
    run(string) 
