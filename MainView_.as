package
{
	import net.wg.gui.components.controls.SoundButtonEx; //現時点ではいらない
  import net.wg.gui.components.controls.SoundButton;
	import net.wg.gui.lobby.header.FightButton; //現時点ではいらない
	import net.wg.infrastructure.base.AbstractWindowView;

	import scaleform.clik.events.ButtonEvent;
	
	public class MainView extends AbstractWindowView {

		//public var redButton:FightButton;
    public var redButton:SoundButton;
		//public var buttonNormal:SoundButtonEx;
    public var buttonNormal:SoundButton;

		public function MainView() {
        super();
		}

		override protected function configUI():void {
			super.configUI();
			redButton = addChild(App.utils.classFactory.getComponent("ButtonRed",SoundButton,{
      width:100,
      height:20,
      x:20,
      y:20,
			label:"Button"
      })) as SoundButton;
      buttonNormal=addChild(App.utils.classFactory.getComponent("ButtonNormal",SoundButton,{
      width:100,
      height:25,
      x:50,
      y:50,
      label:"Close Window"
      }))as SoundButton;
			if (buttonNormal) { // можно смело убрать эти if
				buttonNormal.addEventListener(ButtonEvent.CLICK, this.onClickHandler);
			}
		}

		override protected function onPopulate():void 
		{
			width = 600;
			height = 400;
      window.title = "";
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
	
}
