from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn

@library 

class shop():


    def __init__(self):
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")

    
    @keyword
    def hello (self):
        print("Riyan")


    @keyword
    def add_card_shop_list(self, productlist):

        i = 1
        products = self.sellib.get_webelements("css:.card-title")
        
        for product in products:
            if product.text in productlist:
                self.sellib.click_button("xpath:(//*[@class = 'card-footer'])["+str(i)+"]/button")
        
        i = i + 1
