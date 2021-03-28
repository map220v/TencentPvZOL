package com.qq.modules.td.view.game.ui
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.core.IDisposable;
   import com.qq.utils.blit.QBlitUI;
   
   public class TDLevelBar implements IDisposable
   {
       
      
      private var _level:int = 0;
      
      private var _levelBarList:Array;
      
      private var _curLevelBar:IBlitClip;
      
      private var _levelBarMC:IBlitDisplayContainer;
      
      public function TDLevelBar()
      {
         var _loc2_:IBlitClip = null;
         this._levelBarList = [];
         super();
         this._levelBarMC = QBlitUI.createContainer();
         this._levelBarMC.mouseEnabled = false;
         var _loc1_:int = 0;
         while(_loc1_ < 4)
         {
            _loc2_ = QBlitUI.createClipFromClassName("TDUI_levelBarImg_" + _loc1_);
            this._levelBarList.push(_loc2_);
            _loc2_.x = 2;
            _loc2_.y = 3;
            _loc1_++;
         }
         this._curLevelBar = this._levelBarList[0];
         this._levelBarMC.AddChild(this._curLevelBar);
      }
      
      public function get levelBarMC() : IBlitDisplayContainer
      {
         return this._levelBarMC;
      }
      
      public function Dispose() : void
      {
      }
      
      public function get hasDisposed() : Boolean
      {
         return false;
      }
      
      public function setLevel(param1:int) : void
      {
         if(param1 > 3)
         {
            return;
         }
         if(param1 != this._level)
         {
            this._level = param1;
            if(this._curLevelBar && this._levelBarMC.Contains(this._curLevelBar))
            {
               this._levelBarMC.RemoveChild(this._curLevelBar);
            }
            this._curLevelBar = this._levelBarList[Math.max(param1,0)];
            this._levelBarMC.AddChild(this._curLevelBar);
         }
      }
   }
}
