#!/usr/bin/env python
# coding: utf-8

# In[3]:


import pandas as pd    
import numpy as np  
import seaborn as sns 
import matplotlib.pyplot as plt


# In[5]:


df=pd.read_csv("retail_sales_project.csv")
df


# In[59]:


#*****    Checking data quality     *******#


# In[6]:


# checking top 5 records 
df.head()


# In[7]:


# checking bottom 5 records 
df.tail()


# In[8]:


# size 
df.shape


# In[9]:


# checking data types 
df.dtypes


# In[10]:


# checking null values 
df.isnull().sum()


# In[11]:


# checking null % 
(df.isnull().sum()/len(df)*100)


# In[12]:


# Statastics 
df.describe()


# In[13]:


# checking duplicates(customer id can be duplicate because customer can place multiple orders) ==> regular customers
df['customer_id'].duplicated().sum()


# In[14]:


# distinct cities 
df['customer_city'].unique()


# In[15]:


# distinct states 
df['customer_state'].unique()


# In[16]:


# checking invalid values 
df.select_dtypes(include='number')\
.where(df.select_dtypes(include='number')<=0)\
.stack() 
# no invalid found


# In[ ]:


#     #


# In[18]:


# handling data types

# fixing categorical columns 

category_columns =[
    'customer_city',
    'customer_state',
    'customer_segment',
    'delivery_status',
    'cancel_reason',
    'day_type',
    'brand',
    'category',
    'subcategory',
    'product_returned',
    'order_channel',
    'payment_type'
]
df[category_columns] = df[category_columns].astype('category')


# In[19]:


# fixing date columns 

df['order_date'] = pd.to_datetime(df['order_date'])

df['delivery_date'] = pd.to_datetime(df['delivery_date'])


# In[20]:


# time
df['order_time'] = pd.to_datetime(df['order_time']).dt.time


# In[68]:


# numerical columns 

numeric_columns = [
    'delivery_days',
    'price',
    'discount',
    'quantity',
    'amount',
    'product_cost',
    'earning',
    'profit',
    'customer_rating',
    'shipping_cost'
]

df[numeric_columns] = df[numeric_columns].apply(pd.to_numeric, errors='coerce')


# In[22]:


# validating 
df.dtypes


# In[26]:


print(df.columns)


# In[ ]:


#** Handling NULL values **#


# In[27]:


# discount ==> 0 

df['discount'].fillna(0, inplace=True)


# In[ ]:


# rating null values  ==> i am not going to fill that column null values because no rating might be no rating given by the customer 

# later i will calculate rating percentage then i will get to know that how much % of customers not given the reviews / rating 


# In[ ]:


#** Data Validation **#


# In[28]:


# checking is delivery date is there for cancelled orders 

df[(df['delivery_status'] == 'Cancelled') & (df['delivery_date'].notna())]


# In[29]:


# checking is order date is > delivery date  

df[df['delivery_date'] < df['order_date']]


# In[30]:


# checking is discount > price 

df[df['discount'] > df['price']]


# In[31]:


# assuming that where discount > price came by data entry mistake , so i am replacing those records discount with ==> 0 

df.loc[df['discount'] > df['price'], 'discount'] = 0


# In[32]:


# verifying
df[df['discount'] > df['price']]


# In[35]:


# business rule validation #

# amount remains the same
df['amount'] = df['price'] * df['quantity']

# calculate earning
df['earning'] = (df['price'] - df['discount']) * df['quantity']

# calculate profit
df['profit'] = df['earning'] - (df['product_cost'] * df['quantity'])


# In[62]:


df


# In[63]:


# checking is there delivery days for cancelled orders  

df[(df['delivery_status'] == 'Cancelled') & (df['delivery_date'].notna())]


# In[64]:


# checking is there cancel reason for deliveried and returnded orders because it should have only for cancelled orders 

df[(df['delivery_status'] != 'Cancelled') & (df['cancel_reason'].notna())]


# In[44]:


# checking is there any money (eg : 5000) in earning columns for cancelled and returned columns

df[(df['delivery_status'].isin(['Cancelled','Returned'])) & (df['earning'] > 0)]

# yes there are amount in earning column even though order is cancelled / returned that is not correct business logic so here i am replace those with "0"
# Because when product is returned or cancelled then earning will be zero(0)


# In[45]:


# fixing with zero(0) 

df.loc[df['delivery_status'].isin(['Cancelled','Returned']), 'earning'] = 0


# In[65]:


# cross checking 

df[(df['delivery_status'].isin(['Cancelled','Returned'])) & (df['earning'] > 0)]


# In[49]:


# checking for profit column as earning column 

df[(df['delivery_status'].isin(['Cancelled','Returned'])) & (df['profit'] > 0)]

# yes this column also is against the business logic so i am replace amount with "0" , where there is money for returned and cancelled orders


# In[50]:


# fixing

df.loc[df['delivery_status'].isin(['Cancelled','Returned']), 'profit'] = 0


# In[51]:


# cross checking 

df[(df['delivery_status'].isin(['Cancelled','Returned'])) & (df['profit'] > 0)]


# In[53]:


# checking is there rating for cancelled orders 

df[(df['delivery_status'] == 'Cancelled') & (df['customer_rating'].notna())]

# yes there is a rating for cancelled orders , this is against business logic , so i am replacing it with NULL because cancelled order do not have rating


# In[55]:


# fixing rating to "Null" as per business logic 

df.loc[df['delivery_status'] == 'Cancelled', 'customer_rating'] = None


# In[56]:


# cross checking 

df[(df['delivery_status'] == 'Cancelled') & (df['customer_rating'].notna())]


# In[66]:


df


# In[67]:


df.to_csv('Retail_sales_cleaned_dataset_valid.csv',index=False)

