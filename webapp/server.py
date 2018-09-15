import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        with open("./tests/examples/defaulttimeline.json") as fr:
            self.write(fr.read())

def make_app():
    return tornado.web.Application([
        (r"/timeline", MainHandler),

    ], debug=True)

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()