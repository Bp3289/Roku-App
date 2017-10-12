Sub Main()
    screen = CreateObject("roSGScreen")

    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    m.scene = screen.CreateScene("HomeScreen")

    screen.show()

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while

End Sub

Function initApp()

    app = ParseJson(ReadAsciiFile("pkg:/configs/app.json"))

    app.screens = ParseJson(ReadAsciiFile("pkg:/configs/screens.json"))

    envs = ParseJson(ReadAsciiFile("pkg:/configs/environments.json"))

    app.env = envs[envs.current]

return app
End Function