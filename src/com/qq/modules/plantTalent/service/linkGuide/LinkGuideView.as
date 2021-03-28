package com.qq.modules.plantTalent.service.linkGuide
{
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.utils.UtilsManager;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class LinkGuideView extends Sprite
   {
      
      public static const DIR_DOWN:uint = 1;
      
      public static const DIR_UP:uint = 2;
      
      public static const DIR_RIGHT:uint = 3;
      
      public static const DIR_LEFT:uint = 4;
      
      private static var _instance:LinkGuideView;
       
      
      public var sroundArea:MovieClip;
      
      public var arrowArea:MovieClip;
      
      public var l_word:Label;
      
      private var _hasRemoved:Boolean;
      
      public function LinkGuideView()
      {
         super();
      }
      
      public static function get instance() : LinkGuideView
      {
         if(_instance == null)
         {
            _instance = new LinkGuideView();
            _instance.init();
         }
         return _instance;
      }
      
      private function init() : void
      {
         this.sroundArea = AssetManager.GetClass("UI_Talent_Line_Guide_View_Rect") as MovieClip;
         this.arrowArea = AssetManager.GetClass("UI_Talent_Line_Guide_View_Arrow") as MovieClip;
         this.sroundArea.mouseChildren = this.sroundArea.mouseEnabled = false;
         this.arrowArea.mouseChildren = this.arrowArea.mouseEnabled = false;
      }
      
      public function showGuide(param1:DisplayObjectContainer, param2:Rectangle, param3:String, param4:int = 1) : void
      {
         this.sroundArea.width = param2.width;
         this.sroundArea.height = param2.height;
         this.sroundArea.x = param2.x;
         this.sroundArea.y = param2.y;
         var _loc5_:int = DIR_DOWN;
         while(_loc5_ <= DIR_LEFT)
         {
            this.arrowArea["a" + _loc5_].visible = _loc5_ == param4;
            _loc5_++;
         }
         switch(param4)
         {
            case DIR_DOWN:
               this.arrowArea.x = this.sroundArea.x + (this.sroundArea.width - this.arrowArea.width) * 0.5;
               this.arrowArea.y = param2.y + param2.height + 5;
               break;
            case DIR_UP:
               this.arrowArea.x = this.sroundArea.x + (this.sroundArea.width - this.arrowArea.width) * 0.5;
               this.arrowArea.y = param2.y - this.arrowArea.height - 5;
               break;
            case DIR_LEFT:
               this.arrowArea.x = this.sroundArea.x - this.arrowArea.width - 5;
               this.arrowArea.y = param2.y + 0.5 * param2.height - 0.5 * this.arrowArea.height;
               break;
            case DIR_RIGHT:
               this.arrowArea.x = this.sroundArea.x + this.sroundArea.width + 5;
               this.arrowArea.y = param2.y + 0.5 * param2.height - 0.5 * this.arrowArea.height;
         }
         if(this.l_word && this.l_word.parent != null)
         {
            UtilsManager.removeFromContainer(this.l_word);
            this.l_word = null;
         }
         this.l_word = new Label();
         this.l_word.width = this.arrowArea.width;
         this.l_word.styleName = ".TXT_HKHB_18_WHITE";
         this.l_word.SetStyle("textAlign","center");
         this.l_word.x = this.arrowArea.x;
         this.l_word.y = this.arrowArea.y + this.arrowArea.height * 0.47;
         this.l_word.text = param3;
         param1.addChild(this.sroundArea);
         param1.addChild(this.arrowArea);
         param1.addChild(this.l_word);
         GameGloble.stage.addEventListener(MouseEvent.CLICK,this.onStageClick);
         this._hasRemoved = false;
      }
      
      private function onStageClick(param1:MouseEvent) : void
      {
         this.removeGuide();
      }
      
      public function removeGuide() : void
      {
         if(this._hasRemoved)
         {
            return;
         }
         this._hasRemoved = true;
         GameGloble.stage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
         try
         {
            if(this.l_word && this.l_word.parent != null)
            {
               UtilsManager.removeFromContainer(this.l_word);
            }
            if(this.arrowArea && this.arrowArea.parent != null)
            {
               UtilsManager.removeFromContainer(this.arrowArea);
            }
            if(this.sroundArea && this.sroundArea.parent != null)
            {
               UtilsManager.removeFromContainer(this.sroundArea);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function destroy() : void
      {
         this.l_word = null;
         this.arrowArea = null;
         this.sroundArea = null;
      }
   }
}
