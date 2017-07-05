from gui.Scaleform.framework import ViewTypes
from gui.Scaleform.framework import g_entitiesFactories, ViewSettings, ScopeTemplates
from gui.Scaleform.framework.entities.abstract.AbstractWindowView import AbstractWindowView
from gui.app_loader import g_appLoader
from gui.app_loader.settings import APP_NAME_SPACE
from gui.shared import EVENT_BUS_SCOPE
from gui.shared import events
from gui.shared import g_eventBus

MAIN_VIEW_ALIAS = 'test/mainview'


class MainViewMeta(AbstractWindowView):
    pass


class MainView(MainViewMeta):
    def __init__(self, ctx):
        super(MainView, self).__init__()

    def _populate(self):
        super(MainView, self)._populate()

    def _dispose(self):
        super(MainView, self)._dispose()

    def onWindowClose(self):
        self.destroy()


def onLobbyAppInitialized(event):
    if event.ns != APP_NAME_SPACE.SF_LOBBY:
        return

    app = g_appLoader.getDefLobbyApp()
    app.loadView(MAIN_VIEW_ALIAS, ctx={})


g_entitiesFactories.addSettings(ViewSettings(MAIN_VIEW_ALIAS, MainView, 'MainView.swf', ViewTypes.WINDOW, None, ScopeTemplates.GLOBAL_SCOPE, False))

# покажем окно сразу после загрузки лобби
g_eventBus.addListener(events.AppLifeCycleEvent.INITIALIZED, onLobbyAppInitialized, EVENT_BUS_SCOPE.GLOBAL)
