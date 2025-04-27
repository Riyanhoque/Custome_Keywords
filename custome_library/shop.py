from robot.api.deco import library,keyword


@library 

class shop():

    def __init__(self):
        pass

    @keyword
    def hello_word(self):
        print("hello")