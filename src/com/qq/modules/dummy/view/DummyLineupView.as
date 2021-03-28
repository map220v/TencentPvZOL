package com.qq.modules.dummy.view
{
   import com.qq.GameGloble;
   import com.qq.display.EmbattlePlant;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   import com.qq.utils.UtilsManager;
   
   public class DummyLineupView extends QCanvas
   {
       
      
      public var dummyView:EmbattlePlant;
      
      public var dummyBaseView:EmbattlePlant;
      
      public var isSelf:Boolean;
      
      public function DummyLineupView(param1:Boolean)
      {
         this.isSelf = param1;
         super(DummyLineupViewMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         scrollRectEnabled = false;
         if(this.isSelf)
         {
            scaleX = -1;
         }
         this.dummyBaseView = new EmbattlePlant();
         this.dummyBaseView.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Effect,"dummyBase." + GameGloble.BONE_FILE_EXT),"idle");
         this.dummyBaseView.visible = false;
         this.dummyBaseView.buttonMode = this.isSelf;
         addChild(this.dummyBaseView);
         this.dummyView = new EmbattlePlant();
         this.dummyView.y = -10;
         this.dummyView.buttonMode = this.isSelf;
         this.dummyView.visible = false;
         addChild(this.dummyView);
      }
      
      public function set Scale(param1:Number) : void
      {
         scaleY = param1;
         if(scaleX < 0 && param1 > 0)
         {
            param1 = -param1;
         }
         scaleX = param1;
      }
      
      override public function Dispose() : void
      {
         if(this.dummyView == null)
         {
            UtilsManager.removeFromContainer(this.dummyView);
            this.dummyView.Dispose();
            this.dummyView = null;
         }
         if(this.dummyBaseView == null)
         {
            UtilsManager.removeFromContainer(this.dummyBaseView);
            this.dummyBaseView.Dispose();
            this.dummyBaseView = null;
         }
         super.Dispose();
      }
   }
}
