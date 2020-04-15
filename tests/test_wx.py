import wx
import time


def test_frame():
    a = wx.App()
    myframe = wx.Frame(None, title="Hello World")
    myframe.Show()
    displayed = myframe.IsShown()
#    print("displayed?: "+str(displayed))
    assert displayed is True
    wx.CallAfter(myframe.Close)
    a.MainLoop()
