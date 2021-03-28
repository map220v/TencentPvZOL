package asgui.controls
{
   import asgui.core.IListItemRenderer;
   import asgui.events.AsguiEvent;
   import asgui.styles.StyleManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class SelectableButton extends Button implements IListItemRenderer
   {
      
      public static const SELECTED:String = "selected";
      
      public static const STYLE:String = "SelectableButton";
       
      
      private var selectedChanged:Boolean;
      
      private var _selected:Boolean;
      
      private var labelWidth:int;
      
      public function SelectableButton()
      {
         super();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected != param1)
         {
            this._selected = param1;
            this.selectedChanged = true;
            InvalidateProperties();
            InvalidateSkin();
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      override public function set label(param1:String) : void
      {
         super.label = param1;
         InvalidateDisplayList();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(data.hasOwnProperty(SELECTED) && data[SELECTED] != null)
         {
            this.selected = data[SELECTED];
         }
      }
      
      override protected function OnClick(param1:MouseEvent) : void
      {
         super.OnClick(param1);
         this.selected = !this.selected;
         this.CheckSeletedData();
      }
      
      protected function CheckSeletedData() : void
      {
         if(dataEditable && data && data.hasOwnProperty(SELECTED) && data[SELECTED] != null && data[SELECTED] != this.selected)
         {
            data[SELECTED] = this.selected;
         }
         this.dispatchEvent(new AsguiEvent(AsguiEvent.DATA_CHANGE));
      }
      
      override public function ValidateSize() : void
      {
         if(this.textField)
         {
            this.MeasureWidth(textField.width);
         }
         super.ValidateSize();
      }
      
      override public function ValidateProperties() : void
      {
         super.ValidateProperties();
      }
      
      override public function ValidateSkin() : void
      {
         if(invalidateSkinFlag)
         {
            if(!this.selected)
            {
               $SkinDisabled = null;
               $SkinDown = null;
               $SkinNormal = null;
               $SkinOver = null;
               super.ValidateSkin();
            }
            else
            {
               if(styleDeclaration.selectedDisabledSkin)
               {
                  $SkinDisabled = StyleManager.GetStyleSkin(styleDeclaration.selectedDisabledSkin);
               }
               if(styleDeclaration.selectedDownSkin)
               {
                  $SkinDown = StyleManager.GetStyleSkin(styleDeclaration.selectedDownSkin);
               }
               if(styleDeclaration.selectedNormalSkin)
               {
                  $SkinNormal = StyleManager.GetStyleSkin(styleDeclaration.selectedNormalSkin);
               }
               if(styleDeclaration.selectedOverSkin)
               {
                  $SkinOver = StyleManager.GetStyleSkin(styleDeclaration.selectedOverSkin);
               }
               invalidateStyleFlag = false;
               invalidateSkinFlag = false;
               $Render();
            }
            invalidateSkinFlag = false;
         }
         else
         {
            super.ValidateSkin();
         }
      }
      
      override protected function MeasureWidth(param1:int = 0) : void
      {
         var _loc2_:TextField = null;
         if(this.textField)
         {
            _loc2_ = this.textField;
            param1 = _loc2_.width;
         }
         super.MeasureWidth(param1);
      }
      
      override protected function $DrawDisabled() : void
      {
         if(this.selected)
         {
            this.$DrawDisabledSelected();
         }
         else
         {
            super.$DrawDisabled();
         }
      }
      
      override protected function $DrawDown() : void
      {
         if(this.selected)
         {
            this.$DrawDownSelected();
         }
         else
         {
            super.$DrawDown();
         }
      }
      
      override protected function $DrawOver() : void
      {
         if(this.selected)
         {
            this.$DrawOverSelected();
         }
         else
         {
            super.$DrawOver();
         }
      }
      
      override protected function $DrawNormal() : void
      {
         if(this.selected)
         {
            this.$DrawNormalSelected();
         }
         else
         {
            super.$DrawNormal();
         }
      }
      
      protected function $DrawNormalSelected() : void
      {
         if(textField != null)
         {
            this.styleDeclaration.SetTextFieldSelectedStyle(textField);
            styleDeclaration.SetTextSizeSelected(textField,this.lableWidth,this.lableHeight,lableX,lableY);
         }
      }
      
      protected function $DrawOverSelected() : void
      {
         if(textField != null)
         {
            this.styleDeclaration.SetTextFieldOverSelectedStyle(textField);
            styleDeclaration.SetTextSizeSelected(textField,this.lableWidth,this.lableHeight,lableX,lableY);
         }
      }
      
      protected function $DrawDownSelected() : void
      {
         if(textField != null)
         {
            this.styleDeclaration.SetTextFieldDownSelectedStyle(textField);
            styleDeclaration.SetTextSizeSelected(textField,this.lableWidth,this.lableHeight,lableX,lableY);
         }
      }
      
      protected function $DrawDisabledSelected() : void
      {
         if(textField != null)
         {
            this.styleDeclaration.SetTextFieldDisabledSelectedStyle(textField);
            styleDeclaration.SetTextSizeSelected(textField,this.lableWidth,this.lableHeight,lableX,lableY);
         }
      }
   }
}
