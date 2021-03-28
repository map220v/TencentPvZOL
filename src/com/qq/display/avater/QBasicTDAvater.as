package com.qq.display.avater
{
   import asgui.blit.bone.BlitBone;
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.core.IDisposable;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.display.QCanvas;
   
   public class QBasicTDAvater extends QCanvas implements IDisposable
   {
       
      
      protected var _anim:BlitBoneAnim;
      
      public function QBasicTDAvater()
      {
         super(null);
         this._anim = GameGloble.normalBlitBoneManager.createBoneAnim(BlitBone.TYPE_USE_UNDEFAULT_BLIT_FACTORY);
         $addChild(this._anim.asset.asset);
      }
      
      protected function initHideBones() : void
      {
      }
      
      public function setData(param1:int) : void
      {
      }
      
      protected function play() : void
      {
         var _loc3_:String = null;
         var _loc1_:* = BlitBoneManager.impl;
         this._anim.play(0);
         var _loc2_:Array = this._anim.getAllLabelName();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ == TDConstant.ZombieAnmi_Idle || _loc3_ == TDConstant.ZombieAnmi_Idle2)
            {
               this._anim.gotoAndPlay(_loc3_,0);
               break;
            }
         }
      }
      
      override public function Dispose() : void
      {
         if(this._anim != null)
         {
            this._anim.Dispose();
            this._anim = null;
         }
         super.Dispose();
      }
   }
}
