import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk

class MyWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="GTK Drawing")

        self.drawing_area = Gtk.DrawingArea()
        self.add(self.drawing_area)

        self.drawing_area.connect("draw", self.on_draw)

    def on_draw(self, widget, cr):
        # 设置画笔颜色为红色
        cr.set_source_rgb(1.0, 0.0, 0.0)
        # 绘制一个圆形
        cr.arc(100, 100, 50, 0, 2 * 3.14)
        cr.stroke()

win = MyWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
