package com.qq.modules.levelselect.view.maps
{
   import asgui.controls.Label;
   import asgui.core.IToolTip;
   import com.qq.display.QCanvas;
   import com.qq.modules.levelselect.model.templates.LSGateTemplate;
   import com.qq.modules.levelselect.model.templates.LSGateTemplateFactory;
   
   public class LSMapLevelGateToolTip extends QCanvas implements IToolTip
   {
       
      
      public var txt:Label;
      
      public function LSMapLevelGateToolTip()
      {
         super(LSMapLevelGateToolTipMediator);
         this.styleName = "ToolTip";
         this.txt = new Label();
         this.txt.width = 235;
         this.txt.height = 20;
         this.txt.styleName = ".TXT_HKHB_13_Yellow_Center";
         this.txt.text = "";
         addChild(this.txt);
      }
      
      public function get text() : Object
      {
         return null;
      }
      
      public function set text(param1:Object) : void
      {
         var _loc3_:LSGateTemplate = null;
         var _loc2_:Array = String(param1).split("_");
         if(_loc2_.length == 3)
         {
            _loc3_ = LSGateTemplateFactory.instance.getTemplateByStageIdAndLevelId(_loc2_[0],_loc2_[1],_loc2_[2]);
            reset(_loc3_);
         }
         else
         {
            reset(String(param1));
         }
      }
   }
}
