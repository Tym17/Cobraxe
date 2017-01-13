package;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class Player extends PlayerClub 
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.player__png, true, 16, 16);
	}
	
	override public function update(elapsed:Float)
	{
		movement();
		fire(elapsed);
		super.update(elapsed);
	}
	
	private function movement():Void
	{
		var up:Bool = FlxG.keys.anyPressed([UP, Z]);
		var down:Bool = FlxG.keys.anyPressed([DOWN, S]);
		var right:Bool = FlxG.keys.anyPressed([RIGHT, D]);
		var left:Bool = FlxG.keys.anyPressed([LEFT, Q]);
		var ma:Int = 0;
		
		if (up || down || left || right)
		{
			if (up)
			{
				ma = -90;
				if (left)
					ma -= 45;
				else if (right)
					ma += 45;
			}
			else if (down)
			{
				ma = 90;
				if (left)
					ma += 45;
				else if (right)
					ma -= 45;
			}
			else if (left)
			{
				ma = 180;
			}
			else if (right)
			{
				ma = 0;
			}
			move(ma);
		}
	}
}