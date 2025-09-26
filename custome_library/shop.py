from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn

@library 

class shop():


    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    
    @keyword
    def hello (self):
        print("Riyan")


    @keyword
    def add_card_shop_list(self, productsList):
        # Get WebElements
        i = 1
        productsTitles = self.selLib.get_webelements(" css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")

            i += 1

        self.selLib.click_link("css:li.active a")
        self.selLib.wait_until_element_is_visible("css:.table.table-hover", timeout=15)



        cart_items = self.selLib.get_webelements("css:.table.table-hover a")
        print("Cart items:", [item.text for item in cart_items])
        cart_items_text = [item.text for item in cart_items]
        for product in productsList:
            if product not in cart_items_text:
                raise AssertionError(f"Product '{product}' not found in cart items.")
            
