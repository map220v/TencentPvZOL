package com.qq.modules.battle.view.control
{
   import com.qq.GameGloble;
   import com.qq.modules.battle.view.unit.UnitEffectCav;
   import com.qq.utils.UrlManager;
   import flash.filters.BitmapFilter;
   
   public class UnitRageCtr extends BaseUnitControler
   {
      
      public static const EFFECT_TYPE_PLANT:int = 1;
      
      public static const EFFECT_TYPE_ZOMBIE:int = 2;
       
      
      private var effectType:int;
      
      private var topEffectName:String;
      
      private var bottomEffectName:String;
      
      private var filterName:String;
      
      private var topEffectAnimList:Array;
      
      private var bottomEffectAnimList:Array;
      
      private var filter:BitmapFilter;
      
      private var hasShowMaxRageEffect:Boolean = false;
      
      public function UnitRageCtr()
      {
         this.topEffectAnimList = [];
         this.bottomEffectAnimList = [];
         super();
      }
      
      override public function get ctrType() : String
      {
         return BaseUnitControler.TYPE_RAGE;
      }
      
      override public function dispose() : void
      {
         this.hasShowMaxRageEffect = true;
         this.removeMaxRageEffect();
         super.dispose();
      }
      
      override protected function initlize() : void
      {
      }
      
      public function setRageEffect(param1:int) : void
      {
         this.effectType = param1;
      }
      
      public function showMaxRageEffect() : void
      {
         if(this.hasShowMaxRageEffect)
         {
            return;
         }
         this.hasShowMaxRageEffect = true;
         switch(this.effectType)
         {
            case UnitRageCtr.EFFECT_TYPE_PLANT:
               this.addEffect("plant_skillEffect_body",true,"effect",0,0);
               this.addEffect("plant_skillEffect_foot",false,"effect",0,0);
               break;
            case UnitRageCtr.EFFECT_TYPE_ZOMBIE:
            default:
               this.addEffect("zombie_skillEffect_body",true,"effect",0,0);
               this.addEffect("zombie_skillEffect_foot",false,"effect",0,0);
         }
      }
      
      public function removeMaxRageEffect() : void
      {
         var _loc1_:int = 0;
         if(!this.hasShowMaxRageEffect)
         {
            return;
         }
         this.hasShowMaxRageEffect = false;
         _loc1_ = 0;
         while(_loc1_ < this.bottomEffectAnimList.length)
         {
            _unit.removeBottomEffect(this.bottomEffectAnimList[_loc1_] as UnitEffectCav);
            _loc1_++;
         }
         this.bottomEffectAnimList = [];
         _loc1_ = 0;
         while(_loc1_ < this.topEffectAnimList.length)
         {
            _unit.removeTopEffect(this.topEffectAnimList[_loc1_] as UnitEffectCav);
            _loc1_++;
         }
         this.topEffectAnimList = [];
      }
      
      private function addEffect(param1:String, param2:Boolean, param3:String, param4:Number, param5:Number) : void
      {
         var _loc7_:UnitEffectCav = null;
         var _loc6_:String = UrlManager.getUrl(UrlManager.Url_Battle_Effect,param1 + "." + GameGloble.BONE_FILE_EXT);
         if(param2)
         {
            _loc7_ = _unit.addTopEffect(_loc6_);
            this.topEffectAnimList.push(_loc7_);
         }
         else
         {
            _loc7_ = _unit.addGroundEffect(_loc6_);
            this.bottomEffectAnimList.push(_loc7_);
         }
         _loc7_.mouseChildren = false;
         _loc7_.mouseEnabled = false;
         _loc7_.x += param4;
         _loc7_.y += param5;
         _loc7_.anim.gotoAndPlay(param3,0);
      }
   }
}
