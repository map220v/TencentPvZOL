package asgui.controls.alerts
{
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.controls.Alert;
   import asgui.controls.Button;
   import asgui.controls.Text;
   import asgui.events.CloseEvent;
   import asgui.strings.SS;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class AlertForm extends Canvas
   {
       
      
      private var alert:Alert;
      
      protected var textField:Text;
      
      private var textWidth:Number;
      
      private var textHeight:Number;
      
      private var icon:DisplayObject;
      
      private var btnsBox:HBox;
      
      private var txtCanvas:Canvas;
      
      protected var defaultButton:Button;
      
      private var defaultButtonChanged:Boolean = false;
      
      private var _alertButtonContainerHeight:int;
      
      public function AlertForm(param1:Alert)
      {
         this.alert = param1;
         this.name = "AlertForm";
         super();
      }
      
      override public function Dispose() : void
      {
         while(this.btnsBox.numChildren > 0)
         {
            (this.btnsBox.removeChildAt(0) as Button).removeEventListener(MouseEvent.CLICK,this.ClickHandler);
         }
         this.alert = null;
         this.defaultButton = null;
         super.Dispose();
      }
      
      public function get alertButtonContainerHeight() : int
      {
         return this._alertButtonContainerHeight;
      }
      
      public function set alertButtonContainerHeight(param1:int) : void
      {
         this._alertButtonContainerHeight = param1;
         if(this.txtCanvas)
         {
            this.txtCanvas.bottom = param1;
         }
      }
      
      override public function InitializeComponent() : void
      {
         var _loc4_:String = null;
         var _loc5_:Button = null;
         super.InitializeComponent();
         this.CreateTextField();
         this.btnsBox = new HBox();
         this.btnsBox.name = "btnsBox";
         this.btnsBox.bottom = 0;
         this.btnsBox.hcenter = 0;
         this.addChild(this.btnsBox);
         var _loc1_:Class = this.alert.iconClass;
         if(_loc1_ && !this.icon)
         {
            this.icon = new _loc1_();
            addChild(this.icon);
         }
         var _loc2_:uint = this.alert.buttonFlags;
         var _loc3_:uint = this.alert.defaultButtonFlag;
         if(_loc2_ & Alert.OK)
         {
            _loc4_ = String(Alert.okLabel);
            _loc5_ = this.CreateButton(_loc4_,Alert.OK);
            if(_loc3_ == Alert.OK)
            {
               this.defaultButton = _loc5_;
            }
         }
         if(_loc2_ & Alert.YES)
         {
            _loc4_ = String(Alert.yesLabel);
            _loc5_ = this.CreateButton(_loc4_,Alert.YES);
            if(_loc3_ == Alert.YES)
            {
               this.defaultButton = _loc5_;
            }
         }
         if(_loc2_ & Alert.NO)
         {
            _loc4_ = String(Alert.noLabel);
            _loc5_ = this.CreateButton(_loc4_,Alert.NO);
            if(_loc3_ == Alert.NO)
            {
               this.defaultButton = _loc5_;
            }
         }
         if(_loc2_ & Alert.CANCEL)
         {
            _loc4_ = String(Alert.cancelLabel);
            _loc5_ = this.CreateButton(_loc4_,Alert.CANCEL);
            if(_loc3_ == Alert.CANCEL)
            {
               this.defaultButton = _loc5_;
            }
         }
         if(this.defaultButton)
         {
            this.defaultButtonChanged = true;
            InvalidateProperties();
         }
      }
      
      protected function CreateButton(param1:String, param2:int) : Button
      {
         var _loc3_:Button = Alert.createButtonFunction();
         _loc3_.id = param2.toString();
         _loc3_.name = "btn_" + _loc3_.id;
         _loc3_.label = param1;
         _loc3_.addEventListener(MouseEvent.CLICK,this.ClickHandler);
         this.btnsBox.addChild(_loc3_);
         return _loc3_;
      }
      
      protected function CreateTextField() : void
      {
         this.txtCanvas = new Canvas();
         this.txtCanvas.top = 0;
         this.txtCanvas.left = 0;
         this.txtCanvas.right = 0;
         this.txtCanvas.bottom = this.alertButtonContainerHeight;
         this.addChild(this.txtCanvas);
         this.textField = Alert.createTextFunction();
         this.textField.left = 0;
         this.textField.right = 0;
         this.textField.top = 0;
         this.textField.bottom = 0;
         this.textField.styleName = this.alert.styleName;
         this.txtCanvas.addChild(this.textField);
      }
      
      private function ClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:CloseEvent = new CloseEvent(CloseEvent.CLOSE);
         _loc2_.detail = int((param1.currentTarget as Button).id);
         this.dispatchEvent(_loc2_);
      }
      
      override public function ValidateProperties() : void
      {
         if(invalidatePropertiesFlag)
         {
            this.textField.text = SS.$(this.alert.text);
         }
         super.ValidateProperties();
      }
   }
}
