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
driver.get('https://www.gog.com/#giveaway')
driver.maximize_window()

# Probably doesn't handle non-giveaway periods well
print('Searching for giveaway')
xpath = '//*[@id="giveaway"]/div[3]/div[2]/button/span[1]'
success_xpath = '//*[@id="giveaway"]/div[4]/div/span[1]'
WebDriverWait(driver, timeout=30)
giveaway_text = ''
success_text = ''

# wait for page to populate properly. yay angular
print('Waiting for page to populate')
while giveaway_text != 'Add to library' and  success_text != 'Success!':
    giveaway_button = driver.find_element('xpath', xpath)
    success_text = driver.find_element('xpath', success_xpath).text
    giveaway_text = giveaway_button.text
    time.sleep(5)

# we broke out of loop but haven't downloaded
if len(success_text) == 0:
    print('Unclaimed giveaway. Claiming.')
    giveaway_button.click()
    time.sleep(30)
else:
    print('Already claimed.')

driver.quit()