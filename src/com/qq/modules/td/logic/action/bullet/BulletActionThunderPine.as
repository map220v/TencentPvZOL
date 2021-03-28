package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   
   public class BulletActionThunderPine extends BulletActionLine
   {
       
      
      private var _damageValue:Number;
      
      public function BulletActionThunderPine()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_bullet.shooter)
         {
            this._damageValue = (_bullet.shooter as BasicPlant).plantData.plantStaticInfo.baseInfo.getParam(TDConstant.Plant_Param_Thunder_Bubble_Power);
         }
         else
         {
            this._damageValue = 15000;
         }
      }
      
      override protected function updateBulletState() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:IGameObject = getFireTarget();
         if(_loc1_ != null)
         {
            if(_loc1_.objectModel.hasBuff(TDConstant.TDBuffID_BubbleSround) || _loc1_.objectModel.hasBuff(TDConstant.TDBuffID_Special_BubbleSround))
            {
               _bullet.setAction(TDConstant.BAction_Disappear);
               TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Bubble_Eletric_Split,_loc1_.x,_loc1_.y - _loc1_.damageArea.height * 0.5);
               _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
               _loc2_.setAction(TDConstant.ElectricBubbleExplode,[_loc1_,this._damageValue]);
            }
            else
            {
               TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_ThunderPine_Hit,_bullet.x,_bullet.y,new TDEffectPlayInfo("animation"));
               doBulletBoom(_loc1_);
            }
         }
         else if(!TDGameInfo.getInstance().isInScreen(_bullet.x,_bullet.y))
         {
            _bullet.setAction(TDConstant.BAction_Disappear);
         }
      }
   }
}
