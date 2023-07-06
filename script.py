from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import sys

from pymongo import MongoClient
chrome_options = Options()

host = sys.argv[1]

pages = "http://quotes.toscrape.com/page/" + sys.argv[2]+ "/"

chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--headless")

# Add your Selenium IP Here
driver = webdriver.Remote(options=chrome_options,command_executor="http://selenium:4444/wd/hub")
driver.get(pages)
client = MongoClient(host=host, port=27017)
db = client['mcs_assignment']
collection = db['quotes']
for i in range(1, 11):
        quote_xpath = f"/html/body/div[1]/div[2]/div[1]/div[{i}]/span[1]"
        author_xpath = f"/html/body/div[1]/div[2]/div[1]/div[{i}]/span[2]/small"
        quote_element = driver.find_element(By.XPATH, quote_xpath)
        quote_text = quote_element.text
        author_element = driver.find_element(By.XPATH, author_xpath)
        author_name = author_element.text
        print("Quote:", quote_text)
        print("Author:", author_name)
        print()
        document = {
        'quote_id': int(sys.argv[2]) * 10 + i,
        'quote': quote_text,
        'author': author_name
        }
        collection.insert_one(document)


driver.quit()