package com.qq.modules.embattle.view.components
{
   import com.qq.templates.font.FontNormal;
   
   public class HeathAutoRecoverSettingPanel extends HeathAutoRecoverSettingPanelCE
   {
       
      
      public var heathThresholdList:Array;
      
      public function HeathAutoRecoverSettingPanel()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.heathThresholdList = [20,40,60,80];
         textinput_value.mouseChildren = false;
         checkbox_auto.toolTip = FontNormal.EMBATTLE_AUTO_FIX_HP_TIP;
      }
      
      public function setThresholdIndex(param1:int) : void
      {
         if(param1 >= this.heathThresholdList.length)
         {
            return;
         }
         textinput_value.text = this.heathThresholdList[param1];
      }
      
      public function setThresholdValue(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = this.heathThresholdList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.heathThresholdList[_loc3_];
            if(param1 <= _loc4_)
            {
               textinput_value.text = _loc4_.toString();
               return _loc3_;
            }
            _loc3_++;
         }
         textinput_value.text = this.heathThresholdList[0];
         return 0;
      }
   }
}
