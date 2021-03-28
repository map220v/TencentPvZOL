package com.qq.modules.embattle.view.comps
{
   import asgui.resources.AssetManager;
   import com.qq.templates.font.FontHKHB;
   
   public class FormationTreasureBtn extends FormationBtn
   {
       
      
      public function FormationTreasureBtn(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         img.source = AssetManager.GetClass("City_embattle_formationTreasureBtn");
         img.width = 67;
         img.height = 28;
         img_out.source = AssetManager.GetClass("City_embattle_formationTreasureBtn_out");
         txt.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         txt.x = 0;
         txt.y = 2;
         txt.width = img.width;
         txt.height = img.height;
         txt.mouseChildren = txt.mouseEnabled = false;
         this.buttonMode = true;
         this.width = img.width;
         this.height = img.height;
         defendBtn.visible = false;
         defendLabel.visible = false;
         txt_out.visible = false;
      }
      
      override public function set label(param1:String) : void
      {
         txt.text = FontHKHB.BATTLE_TITLE + param1;
      }
      
      override public function set out(param1:Boolean) : void
      {
         _out = param1;
         img.visible = !!param1 ? false : true;
         img_out.visible = !!param1 ? true : false;
         if(_out)
         {
            txt.text = FontHKHB.BATTLE_OUT;
         }
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
