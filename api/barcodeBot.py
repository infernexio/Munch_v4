from copy import copy
from time import sleep
from tkinter import Variable
from selenium import webdriver      

driver=webdriver.Chrome()
driver2=webdriver.Chrome()
driver.get('http://53a0-216-226-104-11.ngrok.io/uploads/barcode.txt')
var_num = driver.find_element_by_css_selector('body > pre')
driver2.get('https://www.barcodelookup.com/')

searchbox = driver2.find_element_by_xpath('/html/body/section[1]/div/div/div/form/input[2]')
searchbox.send_keys(var_num.text)

searchButton=driver2.find_element_by_xpath('/html/body/section[1]/div/div/div/form/button')
searchButton.click()
sleep(3)
product=driver2.find_element_by_css_selector('#product > section:nth-child(3) > div:nth-child(1) > div > div > div.col-50.product-details > h4')
print(product.text)
sleep(10)
driver.quit()
driver2.quit()
 