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

print('Searching for giveaway')
WebDriverWait(driver, timeout=30)
first_button = driver.find_element('xpath', "//span[text()='Free Now']")
first_button.click()
time.sleep(60)
print('Searching for add to library')
add_to_library_button = driver.find_element('xpath', "//button[@data-testid='purchase-cta-button']")

# add check if button is disabled
add_to_library_button.click()

time.sleep(60)
print('Placing Order')
# todo: make more resilient
iframe = driver.find_element('xpath', "//*[@id='webPurchaseContainer']/iframe")
driver.switch_to.frame(iframe)
time.sleep(30)

# # payment-btn payment-order-confirm__btn payment-btn--primary
place_button = driver.find_element('xpath', "//*[@id='purchase-app']/div/div/div/div[2]/div[2]/div/button")
place_button.click()
time.sleep(60)

driver.quit()