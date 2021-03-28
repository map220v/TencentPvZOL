package com.qq.modules.battle.view.control.unitBuff
{
   import com.qq.GameGloble;
   import com.qq.modules.battle.view.unit.UnitEffectCav;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   
   public class UnitBuffWithEffect extends UnitBuff
   {
       
      
      protected var bufEffect:UnitEffectCav;
      
      public var isLoop:Boolean = true;
      
      public function UnitBuffWithEffect()
      {
         super();
      }
      
      override public function dispose() : void
      {
         if(this.bufEffect)
         {
            this.bufEffect.removeEventListener(Event.COMPLETE,this.onEffectComplete);
            if(unit != null)
            {
               unit.removeTopEffect(this.bufEffect);
               unit = null;
            }
            this.bufEffect.Dispose();
            this.bufEffect = null;
         }
         super.dispose();
      }
      
      override protected function render() : void
      {
         super.render();
         this.creatEffect();
         this.play();
      }
      
      protected function play() : void
      {
         if(this.bufEffect)
         {
            this.bufEffect.anim.gotoAndPlay("animation",!!this.isLoop ? 0 : 1);
         }
      }
      
      protected function onEffectComplete(param1:Event) : void
      {
         this.bufEffect.removeEventListener(Event.COMPLETE,this.onEffectComplete);
         this.bufEffect.anim.stop();
      }
      
      protected function creatEffect() : void
      {
         var _loc2_:int = 0;
         if(unit == null)
         {
            return;
         }
         var _loc1_:String = getEffectResName();
         if(_loc1_ != null && _loc1_.length > 0)
         {
            this.bufEffect = unit.addTopEffect(UrlManager.getUrl(UrlManager.Url_Battle_Effect,_loc1_ + "." + GameGloble.BONE_FILE_EXT),0,"animation");
            this.bufEffect.mouseChildren = false;
            this.bufEffect.mouseEnabled = false;
            this.bufEffect.addEventListener(Event.COMPLETE,this.onEffectComplete);
            _loc2_ = getAlign();
            if(_loc2_ == ALIGN_TOP)
            {
               this.bufEffect.y = -110;
            }
            if(targetIndex % 2 == 0)
            {
               this.bufEffect.scaleX *= -1;
            }
         }
      }
   }
}
