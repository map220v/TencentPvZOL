package com.qq.modules.td.view.game.layer
{
   import asgui.blit.bone.BlitBoneAnim;
   import com.qq.modules.basic.view.MixLayer;
   import com.qq.modules.td.model.TDStageInfo;
   
   public class TDTopGroundLayer extends MixLayer
   {
       
      
      private var bg:BlitBoneAnim;
      
      public function TDTopGroundLayer()
      {
         super();
         setEnable(false);
         var _loc1_:int = TDStageInfo.getInstance().mapID;
         if(_loc1_ == 3)
         {
            if(this.bg != null)
            {
               this.bg.Dispose();
               this.bg = null;
            }
         }
         else
         {
            this.removeAllChild();
            if(this.bg)
            {
               this.bg.Dispose();
               this.bg = null;
            }
         }
      }
      
      override public function Dispose() : void
      {
         this.removeAllChild();
         if(this.bg)
         {
            this.bg.Dispose();
            this.bg = null;
         }
         super.Dispose();
      }
   }
}
