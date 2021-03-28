package com.qq.modules.td.view.game.ui
{
   import asgui.controls.Label;
   import flash.display.MovieClip;
   
   public class TDGameTipCountDown extends MovieClip
   {
       
      
      private var _txtName:Label;
      
      private var _txtCoutDown:Label;
      
      public function TDGameTipCountDown()
      {
         super();
         this._txtName = new Label();
         this._txtName.styleName = ".TXT_HKHB_45_Yellow_Shadow";
         this._txtName.width = 300;
         this._txtName.height = 100;
         this._txtName.text = "剩余时间";
         this.addChild(this._txtName);
         this._txtCoutDown = new Label();
         this._txtCoutDown.width = 100;
         this._txtCoutDown.height = 100;
         this._txtCoutDown.styleName = ".TXT_HKHB_45_Yellow_Shadow";
         this._txtCoutDown.x = 100;
         this._txtCoutDown.y = 50;
         this._txtCoutDown.text = "99";
         this.addChild(this._txtCoutDown);
      }
      
      public function set countDown(param1:int) : void
      {
         this._txtCoutDown.text = param1.toString();
      }
   }
}
