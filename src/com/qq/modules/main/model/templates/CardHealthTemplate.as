package com.qq.modules.main.model.templates
{
   import com.qq.modules.main.model.templates.ce.CardHealthTemplateCE;
   
   public class CardHealthTemplate extends CardHealthTemplateCE
   {
       
      
      public function CardHealthTemplate()
      {
         super();
      }
      
      override public function get powRate() : Number
      {
         return _powRate * 0.01;
      }
   }
}
