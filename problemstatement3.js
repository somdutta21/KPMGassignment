key = "a/b/c"                  
keys = key.split('/')                  
for(i=0; i<keys.length; i++)
{
object = object[keys[i]] 
}
console.log(object) 
                  
#     Output ---> d
