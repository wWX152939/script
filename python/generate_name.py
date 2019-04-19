def str2Hump(text):
    arr = filter(None, text.lower().split('_'))
    res = ''
    for i in arr:
        res =  res + i[0].upper() + i[1:]
    return res
def change_variable_name(listx):    
    listy = listx[0]
    for i in range(1,len(listx)):
        if listx[i].isupper() and not listx[i-1].isupper():
            listy+='_'
            listy+=listx[i]
        elif listx[i].isupper() and listx[i-1].isupper() and listx[i+1].islower():
            listy+='_'
            listy+=listx[i]
        else:
            listy+=listx[i]
    return listy.upper()
def change_variable_name2(listx):    
    listy = listx[0]
    for i in range(1,len(listx)):
        if listx[i].isupper() and not listx[i-1].isupper():
            listy+=listx[i]
        elif listx[i].isupper() and listx[i-1].isupper() and listx[i+1].islower():
            listy+=listx[i]
        else:
            listy+=listx[i]
    return listy.upper()
