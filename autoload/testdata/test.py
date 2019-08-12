
def x(): pass

class Foo:
    def y(self):
        pass

    async def y(self):
        def foo():  # ideally shouldn't jump here, but not so easy to detect.
            pass
        pass


