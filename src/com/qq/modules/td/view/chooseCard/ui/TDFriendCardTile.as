package com.qq.modules.td.view.chooseCard.ui
{
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   
   public class TDFriendCardTile extends TDFriendCardTileCE
   {
       
      
      private var _friendCard:TDBasicChooseCard;
      
      public function TDFriendCardTile()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         label_name.SetStyle("color","#FFF1B3");
         label_name.SetStyle("textAlign","center");
         label_passStage.SetStyle("color","#FFFFFF");
         label_passStage.SetStyle("textAlign","center");
         image_friendIcon.loadTimeout = 5000;
         image_friendIcon.maintainAspectRatio = false;
         image_friendIcon.scaleContent = true;
         image_flag.mouseChildren = false;
         image_flag.mouseEnabled = false;
      }
      
      public function get friendCard() : TDBasicChooseCard
      {
         return this._friendCard;
      }
      
      override public function reset(param1:Object = null) : void
      {
         this._friendCard = param1 as TDBasicChooseCard;
         super.reset(param1);
      }
      
      override public function Dispose() : void
      {
         this._friendCard = null;
         super.Dispose();
      }
   }
}
