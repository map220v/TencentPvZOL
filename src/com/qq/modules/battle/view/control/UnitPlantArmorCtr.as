package com.qq.modules.battle.view.control
{
   import com.greensock.TweenMax;
   import com.qq.modules.battle.view.unit.UnitEffectCav;
   import com.qq.utils.UrlManager;
   
   public class UnitPlantArmorCtr extends BaseUnitControler
   {
      
      public static const DEFAULT_ACTION_NAME:String = "idle";
       
      
      private var _animPlantArmor:UnitEffectCav;
      
      private var m_plantArmorTween:TweenMax;
      
      public function UnitPlantArmorCtr()
      {
         super();
      }
      
      public function setPlantArmorEffect(param1:int) : void
      {
         if(param1 <= 0)
         {
            return;
         }
         var _loc2_:String = UrlManager.getUrl(UrlManager.Url_PlantArmor_Effect,"effect" + param1 + ".bbone");
         this._animPlantArmor = new UnitEffectCav(_loc2_,DEFAULT_ACTION_NAME);
         this._animPlantArmor.x = 15;
         this._animPlantArmor.scaleX = this._animPlantArmor.scaleY = 0.55;
         this._animPlantArmor.alpha = 0;
         this._unit.getAnimaAwakeFrontEffectLayer().addChild(this._animPlantArmor);
         this._animPlantArmor.anim.gotoAndPlay(DEFAULT_ACTION_NAME,0);
         this.m_plantArmorTween = TweenMax.fromTo(this._animPlantArmor,2,{"alpha":0},{
            "alpha":1,
            "delay":3
         });
         this.m_plantArmorTween.repeatDelay = 5;
         this.m_plantArmorTween.repeat = -1;
         this.m_plantArmorTween.yoyo = true;
      }
      
      override public function get ctrType() : String
      {
         return BaseUnitControler.TYPE_PLANTARMOR;
      }
      
      override public function dispose() : void
      {
         if(this.m_plantArmorTween != null)
         {
            this.m_plantArmorTween.kill();
            this.m_plantArmorTween = null;
         }
         if(this._animPlantArmor)
         {
            if(this._unit.getAnimaAwakeFrontEffectLayer().contains(this._animPlantArmor))
            {
               this._unit.getAnimaAwakeFrontEffectLayer().removeChild(this._animPlantArmor);
            }
            if(!this._animPlantArmor.hasDisposed)
            {
               this._animPlantArmor.Dispose();
            }
         }
      }
   }
}
