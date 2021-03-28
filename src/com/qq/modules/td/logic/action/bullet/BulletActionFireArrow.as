package com.qq.modules.td.logic.action.bullet
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDHurtPlantCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.CommandDispatcher;
   
   public class BulletActionFireArrow extends BulletActionArrow
   {
       
      
      private var _fireEffect:IGameObject;
      
      public function BulletActionFireArrow()
      {
         super();
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         this._fireEffect = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,5100);
         CommandDispatcher.send(CommandName.TD_Add_UnitToBulletLayer,{
            "object":this._fireEffect,
            "x":_gameObject.x,
            "y":_gameObject.y
         });
      }
      
      override protected function updateBulletPos() : void
      {
         super.updateBulletPos();
         this._fireEffect.x = _gameObject.x;
         this._fireEffect.y = _gameObject.y;
      }
      
      override protected function updateBulletState() : void
      {
         if(_isFinish)
         {
            if(TDCheckCollision.isCollision(_gameObject,_gameObject.damageArea,_bullet.target,_bullet.target.damageArea))
            {
               TDHurtPlantCmd.firePlant(_bullet.target);
            }
            _gameObject.dispose();
         }
      }
      
      override public function dispose() : void
      {
         if(this._fireEffect != null)
         {
            this._fireEffect.dispose();
         }
         super.dispose();
      }
   }
}
