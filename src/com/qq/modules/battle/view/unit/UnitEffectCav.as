package com.qq.modules.battle.view.unit
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import com.qq.display.QCanvas;
   
   public class UnitEffectCav extends QCanvas
   {
       
      
      private var url:String;
      
      private var defaultActionName:String;
      
      private var frameRate:Number;
      
      private var _anim:BlitBoneAnim;
      
      public function UnitEffectCav(param1:String, param2:String)
      {
         this.url = param1;
         this.defaultActionName = param2;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         scrollRectEnabled = false;
         this._anim = BlitBoneManager.impl.createBoneAnim();
         this._anim.data = BlitBoneManager.impl.getBoneDataByUrl(this.url);
         addChild(this._anim.asset.asset);
         this._anim.gotoAndPlay(this.defaultActionName,0);
      }
      
      public function get anim() : BlitBoneAnim
      {
         return this._anim;
      }
      
      override public function Dispose() : void
      {
         if(this._anim)
         {
            if(this._anim.asset && this._anim.asset.asset)
            {
               removeChild(this._anim.asset.asset);
            }
            this._anim.Dispose();
            this._anim = null;
         }
         super.Dispose();
      }
   }
}
