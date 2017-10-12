Sub Main()
    showHomeScreen()
end sub

Sub showHomeScreen()

    screen = CreateObject("roSGScreen")

    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    m.scene = screen.CreateScene("AppScene")

    m.global = screen.getGlobalNode()

    m.global.AddFields({app:initApp()})

    data = ParseJson(ReadAsciiFile("pkg:/data/data.json"))
    m.gloabal.AddFields({data:data})

    screen.show()

End Sub

Function initApp()

    app = ParseJson(ReadAsciiFile("pkg:/configs/app.json"))

    app.screens = ParseJson(ReadAsciiFile("pkg:/configs/screens.json"))

    envs = ParseJson(ReadAsciiFile("pkg:/configs/environments.json"))

    app.env = envs[envs.current]

return app
End Function