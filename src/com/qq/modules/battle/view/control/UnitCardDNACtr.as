package com.qq.modules.battle.view.control
{
   import com.qq.modules.battle.view.unit.UnitEffectCav;
   import com.qq.utils.UrlManager;
   
   public class UnitCardDNACtr extends BaseUnitControler
   {
      
      public static const DEFAULT_ACTION_NAME:String = "idle";
       
      
      private var _animBackDNA:UnitEffectCav;
      
      private var _animFrontDNA:UnitEffectCav;
      
      public function UnitCardDNACtr()
      {
         super();
      }
      
      public function setDNAEffect(param1:int) : void
      {
         if(param1 <= 0)
         {
            return;
         }
         var _loc2_:String = UrlManager.getUrl(UrlManager.Url_DNA_Effect,"dna_back_effect" + param1 + ".bbone");
         this._animBackDNA = new UnitEffectCav(_loc2_,DEFAULT_ACTION_NAME);
         this._animBackDNA.scaleX = this._animBackDNA.scaleY = 0.55;
         this._animBackDNA.anim.frameRate = 50;
         this._unit.getAnimaAwakeBackEffectLayer().addChild(this._animBackDNA);
         this._animBackDNA.anim.gotoAndPlay(DEFAULT_ACTION_NAME,0);
         var _loc3_:String = UrlManager.getUrl(UrlManager.Url_DNA_Effect,"dna_front_effect" + param1 + ".bbone");
         this._animFrontDNA = new UnitEffectCav(_loc3_,DEFAULT_ACTION_NAME);
         this._animFrontDNA.scaleX = this._animFrontDNA.scaleY = 0.55;
         this._animFrontDNA.anim.frameRate = 50;
         this._unit.getAnimaAwakeFrontEffectLayer().addChild(this._animFrontDNA);
         this._animFrontDNA.anim.gotoAndPlay(DEFAULT_ACTION_NAME,0);
      }
      
      override public function get ctrType() : String
      {
         return BaseUnitControler.TYPE_DNA;
      }
      
      override public function dispose() : void
      {
         if(this._animBackDNA)
         {
            if(this._unit.getAnimaAwakeBackEffectLayer().contains(this._animBackDNA))
            {
               this._unit.getAnimaAwakeBackEffectLayer().removeChild(this._animBackDNA);
            }
            if(!this._animBackDNA.hasDisposed)
            {
               this._animBackDNA.Dispose();
            }
         }
         if(this._animFrontDNA)
         {
            if(this._unit.getAnimaAwakeFrontEffectLayer().contains(this._animFrontDNA))
            {
               this._unit.getAnimaAwakeFrontEffectLayer().removeChild(this._animFrontDNA);
            }
            if(!this._animFrontDNA.hasDisposed)
            {
               this._animFrontDNA.Dispose();
            }
         }
      }
   }
}
