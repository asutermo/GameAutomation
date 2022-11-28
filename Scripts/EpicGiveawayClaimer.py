import os
import time

from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager

print('Getting web driver')
service = ChromeService(executable_path=ChromeDriverManager().install())

print('Using default Chrome profile')
profile = os.environ.get('USERNAME')
chrome_profile = f"C:\\Users\\{profile}\\AppData\\Local\\Google\\Chrome\\User Data"
chrome_options = ChromeOptions()

chrome_options.add_argument(f'user-data-dir={chrome_profile}')
chrome_options.add_argument(f'--profile-directory=Default')
chrome_options.add_experimental_option("detach", True)

print('Starting Chrome')
driver = webdriver.Chrome(service=service, options=chrome_options)
driver.get('https://store.epicgames.com/en-US/free-games')
driver.maximize_window()


# Probably doesn't handle non-giveaway periods well
print('Searching for giveaway')
first_button_xpath = '//*[@id="dieselReactWrapper"]/div/div[4]/main/div[2]/div/div/div/span[4]/div/div/section/div/div[1]/div/div/a/div/div/div[1]/div[2]/div/div/span'
second_button = '//*[@id="dieselReactWrapper"]/div/div[4]/main/div[2]/div/div/div/div[2]/div[2]/div/aside/div/div/div[6]/div/button'

WebDriverWait(driver, timeout=30)
giveaway_button = driver.find_element('xpath', first_button_xpath)
giveaway_button.click()


driver.quit()