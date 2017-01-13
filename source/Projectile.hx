package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Projectile extends FlxSprite 
{
	public var speed:Float;
	public var damages:Int;
	public var deathTimer:Float;
	private var lifeCounter:Float = 0;
	
	public function new(X:Float, Y:Float, _speed:Float, _angle:Float, ?_damages:Int = 1, ?_death:Float = 2) 
	{
		super(X, Y);
		drag.x = drag.y = 0;
		speed = _speed;
		velocity.set(speed, 0);
		velocity.rotate(FlxPoint.weak(0, 0), _angle);
		damages = _damages;
		deathTimer = _death;
		loadGraphic(AssetPaths.projectile__png, false, 8, 8);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		lifeCounter += elapsed;
		if (lifeCounter >= deathTimer)
		{
			kill();
		}
	}
}