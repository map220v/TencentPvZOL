package com.qq.modules.guide.view.tips
{
   import asgui.core.IDisposable;
   import asgui.resources.AssetManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class GuideArea extends Sprite implements IDisposable
   {
      
      private static var s_instacne:GuideArea;
       
      
      private var m_content:MovieClip;
      
      private var m_hasDisposed:Boolean;
      
      public function GuideArea()
      {
         super();
         this.m_content = AssetManager.GetNewClass("guide_area") as MovieClip;
         this.addChild(this.m_content);
      }
      
      public static function get instance() : GuideArea
      {
         if(s_instacne == null)
         {
            s_instacne = new GuideArea();
         }
         return s_instacne;
      }
      
      public static function Clear() : void
      {
         if(s_instacne)
         {
            s_instacne.Dispose();
            s_instacne = null;
         }
      }
      
      public function resize(param1:int, param2:int) : void
      {
         this.m_content.width = param1;
         this.m_content.height = param2;
      }
      
      public function Dispose() : void
      {
         if(this.m_hasDisposed == false)
         {
            this.m_hasDisposed = true;
            this.m_content.stop();
            this.m_content = null;
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return this.m_hasDisposed;
      }
   }
}
