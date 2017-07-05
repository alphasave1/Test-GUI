import net.wg.gui.components.controls.SoundButtonEx;
import net.wg.gui.lobby.header.FightButton;
import net.wg.infrastructure.base.AbstractWindowView;

import scaleform.clik.events.ButtonEvent;

public class MainView extends AbstractWindowView {

    public var redButton:FightButton;
    public var buttonNormal:SoundButtonEx;

    public function MainView() {
        super();
    }

    override protected function configUI():void {
        super.configUI();
        window.title = "Моё окно";
        if (redButton) { // можно смело убрать эти if
            redButton.label = "Просто кнопка";
        }
        if (buttonNormal) { // можно смело убрать эти if
            buttonNormal.label = "Закрыть окно";
            buttonNormal.addEventListener(ButtonEvent.CLICK, this.onClickHandler);
        }
    }

    override protected function onDispose():void {
        if (redButton) { // можно смело убрать эти if
            redButton.dispose();
        }
        if (buttonNormal) { // можно смело убрать эти if
            buttonNormal.removeEventListener(ButtonEvent.CLICK, this.onClickHandler);
            buttonNormal.dispose();
        }
        super.onDispose();
    }

    private function onClickHandler(param1:ButtonEvent):void {
        onWindowCloseS();
    }
}
