from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn

@library 

class shop():


    def __init__(self):
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")


    @keyword
    def hello_word(self):
        print("hello")