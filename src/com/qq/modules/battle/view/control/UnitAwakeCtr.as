package com.qq.modules.battle.view.control
{
   import com.qq.modules.battle.view.unit.UnitEffectCav;
   import com.qq.utils.UrlManager;
   
   public class UnitAwakeCtr extends BaseUnitControler
   {
       
      
      private const DEFAULT_ACTION_NAME:String = "effect";
      
      private var _animBackAwake:UnitEffectCav;
      
      private var _animFrontAwake:UnitEffectCav;
      
      private var _awakeLevel:int;
      
      public function UnitAwakeCtr()
      {
         super();
      }
      
      override public function get ctrType() : String
      {
         return BaseUnitControler.TYPE_AWAKE;
      }
      
      override protected function initlize() : void
      {
         super.initlize();
      }
      
      public function setAwakeLevel(param1:int) : void
      {
         var _loc3_:String = null;
         this._awakeLevel = param1;
         var _loc2_:String = UrlManager.getUrl(UrlManager.Url_Awake_Effect,"effect_back_" + param1 + ".bbone");
         this._animBackAwake = new UnitEffectCav(_loc2_,this.DEFAULT_ACTION_NAME);
         this._animBackAwake.scaleX = this._animBackAwake.scaleY = 1;
         if(param1 == 5)
         {
            this._animBackAwake.anim.frameRate = 20;
         }
         else
         {
            this._animBackAwake.anim.frameRate = 30;
         }
         this._unit.getAnimaAwakeBackEffectLayer().addChild(this._animBackAwake);
         this._animBackAwake.anim.gotoAndPlay(this.DEFAULT_ACTION_NAME,0);
         if(param1 > 1)
         {
            _loc3_ = UrlManager.getUrl(UrlManager.Url_Awake_Effect,"effect_front_" + param1 + ".bbone");
            this._animFrontAwake = new UnitEffectCav(_loc3_,this.DEFAULT_ACTION_NAME);
            this._animFrontAwake.scaleX = this._animFrontAwake.scaleY = 1;
            if(param1 == 5)
            {
               this._animFrontAwake.anim.frameRate = 20;
            }
            else
            {
               this._animFrontAwake.anim.frameRate = 30;
            }
            this._unit.getAnimaAwakeFrontEffectLayer().addChild(this._animFrontAwake);
            this._animFrontAwake.anim.gotoAndPlay(this.DEFAULT_ACTION_NAME,0);
         }
      }
      
      override public function dispose() : void
      {
         if(this._animBackAwake)
         {
            if(this._unit.getAnimaAwakeBackEffectLayer().contains(this._animBackAwake))
            {
               this._unit.getAnimaAwakeBackEffectLayer().removeChild(this._animBackAwake);
            }
            if(!this._animBackAwake.hasDisposed)
            {
               this._animBackAwake.Dispose();
            }
         }
         if(this._animFrontAwake)
         {
            if(this._unit.getAnimaAwakeFrontEffectLayer().contains(this._animFrontAwake))
            {
               this._unit.getAnimaAwakeFrontEffectLayer().removeChild(this._animFrontAwake);
            }
            if(!this._animFrontAwake.hasDisposed)
            {
               this._animFrontAwake.Dispose();
            }
         }
      }
   }
}
