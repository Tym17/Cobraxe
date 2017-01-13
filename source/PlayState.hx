package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayState extends StateClub
{
	
	override public function create():Void
	{
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.collide(joueur, murs);
		FlxG.collide(groupeProjectiles, murs, projHitWalls);
		FlxG.collide(joueur, groupeVase);
		FlxG.collide(groupeProjectiles, groupeVase, projHitVase);
		FlxG.collide(joueur, groupePomme, playerHitApple);
		super.update(elapsed);
	}
	
	private function playerHitApple(P:Player, A:Apple):Void
	{
		if (P.alive && A.alive)
		{
			compteurPomme += 1;
			A.kill();
			textePomme.text = "Pommes: " + compteurPomme;
		}
	}
	
	private function projHitVase(P:Projectile, V:Vase):Void
	{
		if (P.alive && V.alive)
		{
			P.kill();
			V.kill();
			groupePomme.add(new Apple(V.x, V.y));
		}
	}
	
	private function projHitWalls(P:Projectile, murs:Dynamic):Void
	{
		if (P.alive)
		{
			P.kill();
		}
	}
	
}
