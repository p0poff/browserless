import time
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

time.sleep(5)
driver = webdriver.Remote("http://browser:4444/wd/hub", DesiredCapabilities.CHROME)

driver.get("https://alerts.in.ua")
driver.set_window_size(1280, 1024)

time.sleep(5)
screenshot = driver.save_screenshot('/data/map.png')
driver.quit()