#!/usr/bin/env python
# coding: utf-8

# In[25]:


# 1. import libraries
from bs4 import BeautifulSoup
import requests
import pandas as pd

## installing required libraries. You can simply install packages using conda directly from Jupyter notebook. However, 
## it is recommended to use Terminal as a standard way to install python packages.

import sys
get_ipython().system('conda install --yes --prefix {sys.prefix} -c anaconda beautifulsoup4')
get_ipython().system('conda install --yes --prefix {sys.prefix} -c anaconda requests')


# In[26]:


# 2. url: we start with the 'second' page
url= "https://www.billboard.com/charts/hot-100/"


# In[27]:


# 3. download html with a get request
response = requests.get(url)
response.status_code # 200 status code means OK!


# In[28]:


# 4.1. parse html (create the 'soup')
soup = BeautifulSoup(response.content, "html.parser")
# 4.2. check that the html code looks like it should
soup


# In[29]:


# 5. retrieve/extract the desired info (here, you'll paste the "Selector" you copied before to get the element that belongs to the top movie)

soup.select("#title-of-a-story")


# In[30]:


soup.select(".c-title")[0].get_text(strip=True)


# In[31]:


soup.select(".c-label.a-no-trucate")[0].get_text(strip=True)


# In[32]:


soup.select(".c-title.a-no-trucate")


# In[33]:


#initialize empty lists
songs = []
artists= []


# In[34]:


# define the number of iterations of our for loop 
# by checking how many elements are in the retrieved result set
# (this is equivalent but more robust than just explicitly defining 250 iterations)
num_iter = len(soup.select(".c-title.a-no-trucate"))
num_iter


# In[35]:


# iterate through the result set and retrive all the data
for i in range(num_iter):
    songs.append(soup.select(".c-title.a-no-trucate")[i].get_text(strip=True)) ## getting movies titles
    artists.append(soup.select(".c-label.a-no-trucate")[i].get_text(strip=True)) ## getting dir and actors names
   


# In[36]:


songs_lower= list(map(lambda x: x.lower(),songs))
songs_lower


# In[37]:


artists


# In[38]:


# each list becomes a column
hot_100 = pd.DataFrame({"songs":songs,
                       "artists":artists
                      })

hot_100.head(100)


# In[39]:


#2o Day


# In[40]:


#user_song = input() # input a song you like

import random


# In[41]:


song(user_song)


# In[ ]:


import difflib
x = difflib.get_close_matches(user_song, songs_lower, 1, 0.5)
print (x)


# In[47]:


def song():
    user_song = input()
    
    if str.lower(user_song) in songs_lower:
        return(random.choice(songs_lower))
    elif difflib.get_close_matches(user_song, songs_lower, 1, 0.5)!=[]:
        print(random.choice(songs_lower))
    else:
        return "Your song is not on the hot list"


# In[45]:


song()


# In[49]:


song()


# In[ ]:




