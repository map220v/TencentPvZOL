package com.qq.modules.td.logic.action.zombie.flipCard
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.GameGloble;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.logic.unit.zombie.FlipCardZombie;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class ZActionZombieFlipCard extends ZombieActionWalk
   {
       
      
      private var _stoneCardBone:IBlitDisplayObject;
      
      private var _filpCardAnmi:BlitBoneAnim;
      
      public var _clickArea:Sprite;
      
      private var _point:Point;
      
      public function ZActionZombieFlipCard()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._filpCardAnmi = (_gameObject as FlipCardZombie).filpCardAnmi;
         this._clickArea = (_gameObject as FlipCardZombie).clickArea;
         this._stoneCardBone = _gameObject.animation.getBonesByNameCompare("zombie_camel_board_head_etching_norm");
      }
      
      private function updatePos() : void
      {
         if(this._point == null)
         {
            this._point = new Point();
         }
         this._point.x = this._stoneCardBone.x - 116;
         this._point.y = this._stoneCardBone.y - 135;
         this._filpCardAnmi.asset.x = this._point.x;
         this._filpCardAnmi.asset.y = this._point.y;
         this._point = _gameObject.frontLayer.localToGlobal(this._point);
         this._point.x *= GameGloble.scaleCurrent;
         this._point.y *= GameGloble.scaleCurrent;
         this._clickArea.x = this._point.x;
         this._clickArea.y = this._point.y;
         this._clickArea.scaleX = this._clickArea.scaleY = GameGloble.scaleCurrent;
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this.updatePos();
      }
      
      override public function leaveState() : void
      {
         this._stoneCardBone = null;
         this._filpCardAnmi = null;
         super.leaveState();
      }
   }
}
