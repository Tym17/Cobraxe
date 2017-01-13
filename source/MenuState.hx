package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	private var btn:FlxButton;
	
	override public function create():Void
	{
		btn = new FlxButton(0, 0, "Jouer", goPlay);
		btn.screenCenter();
		add(btn);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function goPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
}
