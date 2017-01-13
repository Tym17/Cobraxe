package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class PlayerClub extends FlxSprite 
{
	public var speed:Float = 200;
	private var timer:Float = 0;
	public var groupeProjectile:FlxTypedGroup<Projectile>;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		drag.x = drag.y = 1600;
	}
	
	public function move(movingAngle:Float)
	{
		velocity.set(speed, 0);
		velocity.rotate(FlxPoint.weak(0, 0), movingAngle);
	}
	
	private function fire(elapsed:Float, ?firerate:Float=0.2):Void
	{
		timer = timer + elapsed;
		if (FlxG.mouse.pressed)
		{
			if (timer > firerate)
			{
				groupeProjectile.add(new Projectile(x, y, 180, Math.atan2(FlxG.mouse.getWorldPosition().y - y, FlxG.mouse.getWorldPosition().x - x) * 180 / Math.PI));
				timer = 0;
			}
		}
	}
	
}